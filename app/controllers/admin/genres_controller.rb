class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new
    @genre.admin_id = current_admin.id
    @genre.save
    redirect_to admin_genres_path
  end
  
  def index
    @genres = Genre.all
  end
end
