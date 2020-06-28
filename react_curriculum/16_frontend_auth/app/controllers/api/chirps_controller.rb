class Api::ChirpsController < ApplicationController
  def create
    @chirp = Chirp.new(chirp_params)
    if @chirp.save
      render :show
    else
      render @chirp.errors.full_messages, status: 401
    end
  end
  
  def update
    @chirp = selected_chirp
    if @chirp && @chirp.update_attributes(chirp_params)
      render :show
    elsif !@chirp
      render json: ['Could not locate chirp'], status: 400
    else
      render json: @chirp.errors.full_messages, status: 401
    end
  end
  
  def show
    @chirp = selected_chirp
  end
  
  def index
    @chirps = Chirp.all
  end
  
  def destroy
    @chirp = selected_chirp
    if @chirp
      @chirp.destroy
      render :show
    else
      render ['Could not find chirp']
    end
  end
  
  private
  
  def selected_chirp
    Chirp.find_by(params[:id])
  end
  
  def chirp_params
    params.require(:chirp).permit(:body, :author_id)
  end
end
