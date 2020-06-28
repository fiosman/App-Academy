class ApplicationController < ActionController::Base
  # This will be on the assessment
  # protect_from_forgery with: :exception

  # make these methods available from within the views
  helper_method :current_user, :logged_in?

  def login!(user)
    # set the session_token for the connection to be the 
    session[:session_token] = user.session_token
  end

  def logout!
    # Scramble the current_user's session_token
    current_user.reset_session_token!

    # Reset the session
    session[:session_token] = nil
  end

  def current_user
    # Check for session_token
    return nil unless session[:session_token]

    # Return the user associated with the session_token (if token is valid)
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def require_logged_out
    # Prevent logged-in users from seeing certain pages
    redirect_to user_url(current_user) if logged_in?
  end

  def require_logged_in
    # Prevent logged-out users from seeing certain pages
    redirect_to new_session_url unless logged_in?
  end
end
