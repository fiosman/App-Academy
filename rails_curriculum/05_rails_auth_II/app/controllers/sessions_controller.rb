class SessionsController < ApplicationController 

  def new
  end 

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if !user 
      flash.now[:errors] = 'Incorrect password/username entered'
      render :new 
    else
      redirect_to cats_url
    end
  end

  def destroy
  end

end