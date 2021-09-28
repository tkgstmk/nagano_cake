class Public::CartItemsController < ApplicationController

  def indexd
    @cart_items = Cart_items.all
    @items = Item.all
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to market_url, notice: 'カートが空になりました。' }
      format.json { head :no_content }
    end
  end
end
