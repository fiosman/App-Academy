class UsersController < ApplicationController 
  before_action :redirect_if_logged_in 

  def create 
    @user = User.new(user_params) 

    if @user.save 
      login_user!(@user)
      redirect_to root_url
    else 
      flash.now[:errors] = @user.errors
      render :new
    end 
  end 
  
  def new 
    @user = User.new 
    render :new 
  end 

  private

  def user_params 
    params.require(:user).permit(:username, :password)
  end 
end 
