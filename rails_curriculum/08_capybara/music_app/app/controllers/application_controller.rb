class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def log_in_user!(user) 
    user.reset_session_token!
    session[:session_token] = user.session_token
  end 

  def log_out_user! 
    current_user.reset_session_token!
    session[:session_token] = nil 
  end 

  def current_user 
    return nil if !session[:session_token] 
    @current_user ||= User.find_by(session_token: session[:session_token])
  end 

  def logged_in?
    return false if !current_user 
    true
  end

  def require_log_in!
    redirect_to new_session_url if !logged_in?
  end

end
