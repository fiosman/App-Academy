class TracksController < ApplicationController 

  def create 
    @track = Track.new(track_params) 

    if @track.save! 
      redirect_to track_url(@track) 
    else 
      render :new
    end
  end 

  def new 
    @album = Album.find(params[:album_id])
    @band = Band.find(@album.band_id)
    @track = Track.new
    render :new
  end 

  def edit 
  end 

  def update 
  end 

  def destroy
  end 

  private 

  def track_prams
    params.require(:track).permit(:title, :ord, :lyrics, :album_id, :bonus) 
  end 

end
