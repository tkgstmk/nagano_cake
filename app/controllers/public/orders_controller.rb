class Public::OrdersController < ApplicationController

  def new
  end

  def confirm
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
  end

end
