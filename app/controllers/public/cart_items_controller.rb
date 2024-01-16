class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @item_id = params[:cart_item][:item_id].to_i
    @amount = params[:cart_item][:amount].to_i
    @cart_item = current_customer.cart_items.find_by(item_id: @item_id)
    if @cart_item
    @cart_item.update(amount: @cart_item.amount+@amount)
    else
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    end
    redirect_to cart_items_path
  end

  def index
  @cart_items = current_customer.cart_items.all
  @total=0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end