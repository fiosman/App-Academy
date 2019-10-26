class ArtworksController < ApplicationController 

  def show 
    render json: Artwork.find(params[:id]) 
  end

  def index 
    render json: Artwork.all 
  end
  
  def create 
    artwork = Artwork.new(artwork_params) 

    if artwork.save 
      render json: artwork 
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy 
    artwork = Artwork.find(params[:id]) 

    if artwork.destroy 
      render json: artwork 
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end 

  def update 
    artwork = Artwork.find(params[:id]) 

    if artwork.update 
      render json: artwork 
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end 

  private 

  def artworks_params 
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end