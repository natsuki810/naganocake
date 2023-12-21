class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: true).order(created_at: "DESC")
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
