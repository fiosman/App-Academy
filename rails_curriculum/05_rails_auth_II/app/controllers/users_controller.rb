class UsersController < ApplicationController 
  def create 
    @user = User.new(user_params) 
    if @user.save 
      redirect_to :cats_url 
    else
      render :new
    end
  end

  def new 
    @user = User.new
    render :new
  end


  def user_params 
    params.require(:user).permit(:username, :password)
  end
end