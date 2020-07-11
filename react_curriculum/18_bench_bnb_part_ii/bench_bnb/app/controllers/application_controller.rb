class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user 

  private

  def logout 
    current_user.reset_session_token!
    session[:session_token] = nil 
    @current_user = nil #because we are using ||= operator in current_user 
  end 

  def login(user) 
    session[:session_token] = user.session_token 
    @current_user = user #same as above
  end 

  def current_user 
    return nil unless session[:session_token]

    @current_user ||= User.find_by(session_token: session[:session_token])
  end 

  def logged_in? 
    !!current_user
  end 

end
