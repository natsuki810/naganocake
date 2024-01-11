class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
     @items = Item.where(is_active: true).order(created_at: :desc)
    @count = 0
  end
end
