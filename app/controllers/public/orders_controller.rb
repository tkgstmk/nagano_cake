class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
    @customer = current_customer
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      flash[:notice] = "アイテムを作成しました"
      redirect_to confirm_path
    else
      # @genres = Genre.all
      render :new
    end
  end
  
  def confirm
    @cart_item = CartItem.find
  end
  
  def thanks
  end
  
  def index
    @orders.current_customer = Order.all
  end
  
  
  
  private
  def order_params
    params.require(:order).permit(:id, :customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status)
  end
end
