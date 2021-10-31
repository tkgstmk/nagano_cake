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
