class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
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
      @order.postal_code = Order.find(params[:id])
      @order.address = Order.find(params[:id])
      @order.name = Order.find(params[:id])
    else 
      # params[:order][:address_select_method] == 'new_address'
      @order = Order.new
    end
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      flash[:notice] = "アイテムを作成しました"
      @cart_items = CartItem.all
      @cart_items.destroy_all
      redirect_to thanks_path
    else
      # @genres = Genre.all
      render :confirm
    end
  end
  
  def thanks
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @orders = current_customer.orders
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
    # @order_details = @order.order_details
  end
  
  
  
  private
  def order_params
    params.require(:order).permit(:id, :customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status)
  end
end
