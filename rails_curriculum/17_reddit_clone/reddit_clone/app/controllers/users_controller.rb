class UsersController < ApplicationController 
  def index 
    @users = User.all 
    render :index 
  end 

  def new
    @user = User.new 
    render :new 
  end 

  def create 
    @user = User.new(user_params) 

    if @user.save 
      log_in_user(@user)
      redirect_to user_url(@user) 
      flash[:notices] = ['Sign up successful!']  
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end 

  def show 
    User.find(id: params[:id]) 
    render :show 
  end 

  private 

  def user_params 
    params.require(:user).permit(:username, :password)
  end 
end