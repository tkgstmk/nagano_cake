class Admin::OrderDetailsController < ApplicationController
  def update
    @order_details = Order_detail.all
    if@order_detail.update_attributes(order_detail.order_params)
      flash[:success] = "ステータスが更新されました"
      redirect_to admin_order_path
    else
      render show
    end    
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:id, :order_id, :item_id, :price, :amount, :making_status)
  end
end
