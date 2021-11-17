class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  before_action :is_cart_item, only: ["new", "create", "confirm"]
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses
    @customer = current_customer
    # redirect_to confirm_path
  end
  
  def confirm
    params[:order][:address_select_method]
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    # @orders = current_customer.orders
    
    if params[:order][:address_select_method] == 'my_address' then
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_select_method] == 'post_address' then
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order][:address_select_method] == 'new_address'
      @order = Order.new(order_params)
    end
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      flash[:notice] = "アイテムを作成しました"
      
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_detail = @order.order_details.new
        order_detail.item_id = cart_item.item_id
        order_detail.customer_id = cart_item.customer.id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.price
        order_detail.save!
      end
      @cart_items.destroy_all
      redirect_to thanks_path
    else
      render :confirm
    end
  end
 
  
  def thanks
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    # @orders = current_customer.orders
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    p OrderDetail.all
  end
  
  
  
  private
  def order_params
    params.require(:order).permit(:id, :customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status)
  end
  
  def is_cart_item
    unless CartItem.where(customer_id: current_customer.id).present?
      redirect_to cart_items_path
    end
  end
end
