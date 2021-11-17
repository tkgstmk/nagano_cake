class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
     
      
    if @order.update(order_params)
      # @order_detail.update_attributes(order_detail.order_params)
      
     # 注文ステータスを更新すると製作ステータスも更新される
      if @order.status == "確認待ち"
        @order_details.each do |order_detail|
          order_detail.making_status = "製作待ち"
          order_detail.save
        end
      end
      
      flash[:success] = "ステータスが更新されました"
      redirect_to admin_order_path
    else
      render show
    end    
  end
  
  private
  def order_params
    params.require(:order).permit(:id, :customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status)
  end
end
