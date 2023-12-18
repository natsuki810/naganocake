class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.reverse 
    @count = 0
  end
end
