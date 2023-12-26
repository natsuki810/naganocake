class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: true).order(created_at: "DESC")
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

end
