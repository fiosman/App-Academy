class SessionsController < ApplicationController 

  def create 
    user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]  
    )

    if user
      log_in_user!(user)
      flash[:notices] = ["Sign in successful"]
      redirect_to user_url(user)
    else 
      flash.now[:errors] = ["Incorrect credentials!"] 
      render :new
    end
  end 

  def new 
    render :new
  end 

  def destroy 
    log_out_user! 
    redirect_to new_session_url
  end

end 