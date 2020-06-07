class SessionsController < ApplicationController 
  before_action :redirect_if_logged_in, except: :destroy 

  def new 
    @user = User.new 
    render :new 
  end 

  def create
    user = User.find_by_credentials( 
      params[:user][:username], 
      params[:user][:password]
    )

    if user 
      login_user!(user) 
      redirect_to root_url
    else 
      render :new
    end 
  end 

  def destroy 
    logout_user
    redirect_to new_session_url 
  end 

end 
