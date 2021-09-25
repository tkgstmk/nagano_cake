class Admin::OrderDetailsController < ApplicationController
  belongs_to :oder
  belongs_to :item

end
