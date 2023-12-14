class Public::ShoppingAddressesController < ApplicationController
  before_action :authenticate_customer!

  def new
    @shopping_address = Shopping_address.new
  end

  def index
    @shopping_addresses = Shopping_address.all
  end
end
