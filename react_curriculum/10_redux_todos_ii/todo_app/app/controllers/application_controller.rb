class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? 

  private 

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token 
  end 

  def logout_user 
    current_user.reset_session_token! 
    session[:session_token] = nil 
  end 

  def current_user 
    return nil if !session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token]) 
  end 

  def logged_in? 
    current_user != nil 
  end 

  def require_log_in!
    redirect_to new_session_url if !logged_in? 
  end 

  def redirect_if_logged_in
    redirect_to root_url if logged_in?
  end

end
