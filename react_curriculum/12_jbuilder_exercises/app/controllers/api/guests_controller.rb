class Api::GuestsController < ApplicationController
  def index
    @guests = Guest.all
    render :index
  end

  def show
    @guest = Guest.find_by(id: params[:id])
    render :show
  end
end
