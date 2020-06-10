class Api::PokemonController < ApplicationController 
  def index 
    @pokemon = Pokemon.all 
    render json: @pokemon 
  end 

  def show 
    @pokemon = Pokemon.find(params[:id])
    render json: @pokemon 
  end
end