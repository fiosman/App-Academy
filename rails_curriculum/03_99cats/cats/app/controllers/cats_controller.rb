class CatsController < ApplicationController 

  def index 
    render json: Cat.all 
  end

  def show 
    cat = Cat.find_by(id: params[:id]) 
    render json: cat
  end

end