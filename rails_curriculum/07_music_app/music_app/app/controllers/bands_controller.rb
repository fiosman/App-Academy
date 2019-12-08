class BandsController < ApplicationController 
  def create 
    @band = Band.new(band_params) 

    if @band.save 
      redirect_to band_url(@band)
    else 
      render :new
    end 
  end 
  
  def update 

  end

  def new 
    @band = Band.new 
    render :new
  end 

  def edit 

  end 

  def index 
    @bands = Band.all 
    render :index
  end 

  def show
    @band = Band.find_by(id: params[:id]) 
    render :show
  end 

  private 

  def band_params 
    params.require(:band).permit(:name)
  end
end