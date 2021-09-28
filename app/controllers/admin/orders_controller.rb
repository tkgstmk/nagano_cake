class Admin::OrdersController < ApplicationController

has_many :order_details

  def show
    @customers = Customer.all
    @order = Order.find(params[:id])
    @orders_count = Order.where(order_id: @order.id).count
  end


  private
  def order_params
    params.require(:order).permit(:is_active)
  end

  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end



	def price
	  current_item = oder_items.find_by_price_id(price_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = oder_items.build(price_id: price_id)
		end
		  current_item
	end


	def total_price
		oder_items.to_a.sum { |item| item.total_price }
	end

	def total_payment
	  total_price.to_a.sum { |item| item.total_price }
	end


end