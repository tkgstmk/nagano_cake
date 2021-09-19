class Admin::Genre < ApplicationRecord
  
  validates :name, presence: true
end
