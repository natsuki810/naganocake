class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
  @cart_items = Cart_item.all
  end
end
