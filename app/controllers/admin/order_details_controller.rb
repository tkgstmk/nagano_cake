class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order_detail.order.order_details
    # @order_detail.order_id = @order_detail.order.id
    # @order_detail.customer_id = @order_detail.order.customer.id
    @order_detail.update!(order_detail_params)
    if @order_detail.making_status == "製作中"
      @order_detail.order.status = "制作中"
      @order_detail.order.save
    elsif @order_detail.order.order_details.all? {|order_detail| order_detail.making_status == "製作完了"}
      @order_detail.order.status = "発送準備中"
      @order_detail.order.save
    end
    
    
    
    
    # if @order.status == "入金確認"
    #     @order_details.each do |order_detail|
    #       order_detail.making_status = "製作待ち"
    #       order_detail.save
    #     end
    #   end
 
    
      flash[:success] = "ステータスが更新されました"
      redirect_to admin_order_path(@order_detail.order)
    # else
    #   render :show
    # end    
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:id, :order_id, :item_id, :price, :amount, :making_status)
  end
end
