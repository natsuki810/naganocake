class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_select] == "1"
      @order.address = current_customer.postal_code
      @order.name = current_customer.address
      @order.postal_code = current_customer.full_name
    elsif params[:order][:address_select] == "2"
      receive_address = ShoppingAddress.find(params[:order][:select_id])
      @order.address = receive_address.address
      @order.name = receive_address.name
      @order.postal_code = receive_address.postal_code
    end
  end
  
  def complete
  
  end
  
  def create
    @order = Oder.nes
    Order.save
  end
  
  
  def index
    @order = Order.all
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
