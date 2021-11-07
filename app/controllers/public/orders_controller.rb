class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
    @customer = current_customer
    # redirect_to confirm_path
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @orders = current_customer.orders
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      flash[:notice] = "アイテムを作成しました"
      redirect_to thanks_path
    else
      # @genres = Genre.all
      render :confirm
      
    end
  end
  
  def thanks
  end
  
  def index
    @orders.current_customer = Order.all
  end
  
  # def show
  #   @order = Order.find(order_params)
  #   @order_details = @order.order_details
  # end
  
  
  
  private
  def order_params
    params.require(:order).permit(:id, :customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status)
  end
end
