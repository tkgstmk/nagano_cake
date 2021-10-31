class Item < ApplicationRecord
    belongs_to :genre
    has_many :orders
    has_many :cart_items
    attachment :image
end
