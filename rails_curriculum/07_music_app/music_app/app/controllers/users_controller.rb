class UsersController < ApplicationController 

  def create
    @user = User.create(user_params) 

    if @user.save 
      redirect_to user_url(params[:id]) 
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end 

  def new
    @user = User.new
    render :new
  end 

  def show
    render :show
  end 

  private 

  def user_params 
    params.require(:user).permit(:password, :email)
  end

end 