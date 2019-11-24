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
      user.session_token = User.generate_session_token
      session[:session_token] = user.session_token 
      redirect_to cats_url
    end
  end

  def destroy
  end

end