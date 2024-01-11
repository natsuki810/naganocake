class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      if params[:order][:status] == "payment_confirmed"
         @order_details.update_all(production_status: 1)
      end
    end
    redirect_to admin_order_path(@order.id)
  end
  
  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :total_payment, :status)
  end
end
