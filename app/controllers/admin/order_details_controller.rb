class Admin::OrderDetailsController < ApplicationController
before_action :authenticate_admin!

private
def order_derail_params
   params.require(:order_derail).permit(:order_id, :item_id, :quantity, :tax_included_price, :production_status)
end
end
