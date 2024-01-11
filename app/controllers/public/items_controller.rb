class Public::ItemsController < ApplicationController
  def index
    if params[:name]
      @items = Item.where("name LIKE?", '%' + params[:name] + '%').page.per(8).order(created_at: :desc).where(is_active: true)
      @genres = Genre.all
    elsif params[:genre_name]
      genre = Genre.find_by(name: params[:genre_name])
      @items = Item.page(params[:page]).per(8).where(is_active: true, genre_id: genre.id)
      # byebug
      @genres = Genre.all
    else
      @items = Item.where(is_active: true)
      @items = Item.page(params[:page]).per(8).where(is_active: true).order(created_at: :desc)
      @genres = Genre.all
    end

    # if 
    # else
    #   @items = Item.page(params[:page]).per(8).where(is_active: true)
    #   @genres = Genre.all
    # end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

end
