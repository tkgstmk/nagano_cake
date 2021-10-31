class Public::HomesController < ApplicationController
  def top
    # @genres = Grenre.all
    @items = Item.all
  end
  
  def about
    
  end
  
  
  private
  def genre_params
    params.require(:genre).permit(:name)
    #params.permit(:title, :body)
  end
end
