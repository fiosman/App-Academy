class UsersController < ApplicationController 
  
  def index 
    render plain: 'hello i am here'
  end

  def create 
    render json: params
  end

  def show 
    render json: params
  end

end