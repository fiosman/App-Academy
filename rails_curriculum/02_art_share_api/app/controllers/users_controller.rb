class UsersController < ApplicationController 
  
  def index 
    if params[:name] 
      render json: User.where(username: params[:name])
    else
      render json: User.all
    end
  end

  def create 
    user = User.new(user_params)

    if user.save 
      render json: user 
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show 
    render json: User.find(params[:id])
  end

  def destroy 
    user = User.find(params[:id]) 

    if user.destroy 
      render json: user
    else
     render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update 
    user = User.find(params[:id]) 

    if user.update(user_params)
      render json: user 
    else
    render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :email)
  end

end