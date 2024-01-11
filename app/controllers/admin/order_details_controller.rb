class Admin::OrderDetailsController < ApplicationController
before_action :authenticate_admin!

def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  @order_detail.update(order_derail_params)
  if params[:order_detail][:production_status] == "production"
     @order.update(status: 2)
  end

  if @order.order_details.all? { |f| f.production_status == "complete"}
     @order.update(status: 3)
  end

  redirect_to admin_order_path(@order)
end

private
def order_derail_params
   params.require(:order_detail).permit(:order_id, :item_id, :quantity, :tax_included_price, :production_status)
end

# def is_order_details_production_status_complete(order)
#     order.order_details.each do |order_detail|
#     if order_detail.production_status != "complete"
#       return false
#     end
#   end
#   return true
# end

end
