class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  def confirm
    @total_price = 0
    @order = Order.new(order_params)
    @order.postage = 800
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

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.quantity = cart_item.amount
        @order_detail.tax_included_price = cart_item.item.add_tax_price
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path, notice: "注文が完了しました。"
    else
      redirect_to orders_confirm_path, alert: "注文を完了できませんでした。"
    end
  end

  def index
    @orders = current_customer.orders.all.reverse
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :total_payment)
  end
end
