class UsersController < ApplicationController 
  
  def index 
    render json: User.all
  end

  def create 
    render json: params
  end

  def show 
    render json: params
  end

end