class Api::PartiesController < ApplicationController
  def index
    @parties = Party.all
    render :index
  end

  def show
    @party = Party.find_by(id: params[:id])
    render :show
  end
end
