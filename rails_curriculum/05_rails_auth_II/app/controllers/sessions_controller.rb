class SessionsController < ApplicationController 

  def new
    render :new
  end 

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if !user 
      flash.now[:errors] = 'Incorrect password/username entered'
      render :new 
    else 
      login_user!(user)
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token! if current_user 
    session[:session_token] = nil 
  end

end