class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @order = Order.all
  end
end
