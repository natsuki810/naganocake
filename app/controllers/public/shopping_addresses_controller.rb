class Public::ShoppingAddressesController < ApplicationController
  before_action :authenticate_customer!

  def new
    @shopping_address = ShoppingAddress.new
  end

  def create
    @shopping_address = ShoppingAddress.new(shopping_address_params)
    @shopping_address.customer_id = current_customer.id
    @shopping_address.save
    @shopping_addresses = ShoppingAddress.all
    redirect_to shopping_addresses_path
  end

  def index
    @shopping_addresses = ShoppingAddress.all
  end

  def edit
    @shopping_address = ShoppingAddress.find(params[:id])
  end

  def update
    @shopping_address = ShoppingAddress.find(params[:id])
    @shopping_address.update(shopping_address_params)
    redirect_to shopping_addresses_path
  end

  def destroy
    @shopping_address = ShoppingAddress.find(params[:id])
    @shopping_address.destroy
    redirect_to shopping_addresses_path
  end

  private
  def shopping_address_params
    params.require(:shopping_address).permit(:postal_code, :address, :name)
  end
end
