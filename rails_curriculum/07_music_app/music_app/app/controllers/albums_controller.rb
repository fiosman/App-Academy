class AlbumsController < ApplicationController 

  def show 
  end 

  def create 
  end 

  def edit 
  end 

  def update 

  end 

  def destroy 

  end 

  def new 
    @album = Album.new 
    render :new
  end 

  def album_params 
    params.require(:album).permit(:title, :year, :band_id, :live)
  end 
end 
