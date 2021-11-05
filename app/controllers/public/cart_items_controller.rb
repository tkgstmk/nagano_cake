class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  
  
  
  def destroy
    @cart_item = CartItem.find(params[:id])  # データ（レコード）を1件取得
    @cart_item.destroy  # データ（レコード）を削除
    redirect_to cart_items_path  # 投稿一覧画面へリダイレクト
  end
  
  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy
    redirect_to cart_item_path(cart_item) 
    
  end
  
  private
  def cart_items_params
    params.require(:cart_item).permit(:id, :item_id, :customer_id, :amount)
  end
end








# index
# update
# destroy
# destroy_all
# create



#   before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

#   def show
#     @cart_items = current_cart.cart_items
#   end

#   # 商品一覧画面から、「商品購入」を押した時のアクション
#   def add_item
#     if @cart_item.blank?
#       @cart_item = current_cart.cart_items.build(product_id: params[:product_id])
#     end

#     @cart_item.quantity += params[:quantity].to_i
#     @cart_item.save
#     redirect_to current_cart
#   end

#   # カート詳細画面から、「更新」を押した時のアクション
#   def update_item
#     @cart_item.update(quantity: params[:quantity].to_i)
#     redirect_to current_cart
#   end

# 　# カート詳細画面から、「削除」を押した時のアクション
#   def delete_item
#     @cart_item.destroy
#     redirect_to current_cart
#   end

#   private

#   def setup_cart_item!
#     @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
#   end
# end
