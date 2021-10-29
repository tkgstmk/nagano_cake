class Admin::OrdersController < ApplicationController
  def show
    @order = Order.faimd(params[:id])
    @customer = Customer.find(params[:id])
  end
  
  private
  def order_params
    params.require(:order).permit(:id, :customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status)
  end
end
