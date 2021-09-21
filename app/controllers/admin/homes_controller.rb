class Admin::HomesController < ApplicationController


  def top
    @oders = Oder.all
  end

end
