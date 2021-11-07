class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    # redirect_to cart_items_path
  end
  
  private
  def item_params
    params.require(:item).permit(:id, :name, :image, :introduction, :price, :genre_id, :is_active)
  end
end
