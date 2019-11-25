class ApplicationController < ActionController::Base
  helper_method :current_user 

  private 

  def current_user
    return nil if !session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout_user! 
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def already_signed_in
    #redirect user to cats index if they try to visit login/create pages when already signed in
    redirect_to cats_url if current_user
  end
end
