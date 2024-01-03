class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  def confirm
    @order = Order.new(order_params)
    @customer = current_customer

    if params[:order][:address_select] == "1"
      @order.address = @customer.address
      @order.name = @customer.full_name
      @order.postal_code = @customer.postal_code
    elsif params[:order][:address_select] == "2"
      receive_address = ShoppingAddress.find(params[:order][:address_id])
      @order.address = receive_address.address
      @order.name = receive_address.name
      @order.postal_code = receive_address.postal_code
    else
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @order.postal_code = params[:order][:postal_code]
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path, notice: "注文が完了しました。"
    else
      redirect_to confirm_path, alert: "注文を完了できませんでした。"
    end
  end
  
  def index
    @orders = Order.all
    @customer = current_customer
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

  def complete_order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :address_select)
  end
end
