class Admin::OrderDetailsController < ApplicationController
  belongs_to :orders
  belongs_to :items

end
