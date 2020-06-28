class ChirpsController < ApplicationController

  def new
    @chirp = Chirp.new
    render :new
  end

  def create
    @chirp = Chirp.new(chirp_params)
    @chirp.author_id = current_user.id
    if @chirp.save
      redirect_to chirp_url(@chirp)
    else
      render json: @chirp.errors.full_messages, status: 422
    end
  end

  def show
    @chirp = Chirp.find(params[:id])
    if @chirp
      render :show
    else
      render json: @chirp.errors.full_messages, status: 404
    end
  end

  def index
    @chirps = if params[:user_id]
                Chirp.where(author_id: params[:user_id])
              else
                Chirp.all
              end
    render :index
  end

  def edit
    @chirp = Chirp.find(params[:id])
    render :edit
  end

  def update
    @chirp = Chirp.find(params[:id])
    if @chirp.update(chirp_params)
      redirect_to chirp_url(@chirp)
    else
      render json: @chirp.errors.full_messages, status: 422
    end
  end

  def destroy
    @chirp = Chirp.find(params[:id])
    if @chirp.destroy
      redirect_to chirps_url
    else
      render plain: "You can't destroy what's not there."
    end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:body, :author_id)
  end
end
