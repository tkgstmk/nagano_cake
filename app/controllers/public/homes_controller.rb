class Public::HomesController < ApplicationController

  def top
    # @genres = Grenre.all
    @items = Item.all
  end
  
  def about
    
  end

end
