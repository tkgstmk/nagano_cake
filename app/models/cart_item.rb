class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  # def subtotal
  #   (cart_item.item.price * 1.1 * amount).to_a.sum
  # end
  
#   def total_price
# 		line_items.to_a.sum { |item| item.total_price }
# 	end
  
end
