class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @items = Item.where(is_active: true)
    @items = Item.page(params[:page]).per(8).order(created_at: :desc)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

end
