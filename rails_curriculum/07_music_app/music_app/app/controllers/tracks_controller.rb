class TracksController < ApplicationController 

  before_action :require_log_in!

  def create 
    @track = Track.new(track_params) 

    if @track.save! 
      redirect_to track_url(@track) 
    else 
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end 

  def new 
    @album = Album.find(params[:album_id])
    @band = Band.find(@album.band_id)
    @track = Track.new(album_id: params[:album_id])
    render :new
  end 

  def edit 
    @track = Track.find(params[:id])
    render :edit 
  end 

  def update 
    @track = Track.find(params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else 
      render :edit
    end
  end 

  def destroy
    @track = Track.find(params[:id]) 
    @track.destroy 

    redirect_to album_url(@track.album_id)
  end 

  def show 
    @track = Track.find(params[:id])
    render :show
  end

  private 

  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :album_id, :bonus) 
  end 

end
