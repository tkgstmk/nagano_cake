class Admin::OdersController < ApplicationController
  def top
    @customers = Customer.all
    @oder = Oder.find(params[:id])
    @oders_count = Oder.where(oder_id: @oder.id).count
  end

  def show
    @customers = Customer.all
    @oder = Oder.find(params[:id])
    @oders_count = Oder.where(oder_id: @oder.id).count
  end


  private
  def oder_params
    params.require(:oder).permit(:is_active)
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