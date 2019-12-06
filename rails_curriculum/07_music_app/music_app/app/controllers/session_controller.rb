class SessionsController < ApplicationController 

  def create
    user = User.find_by_credentials(
      params[:user][:email], 
      params[:user][:password]
    )

    if user 
      log_in_user!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = ['Incorrect password/username entered']
      render :new
    end
  end 

  def destroy
    log_out_user! 
    redirect_to new_session_url
  end

  def new 
    render :new 
  end

end