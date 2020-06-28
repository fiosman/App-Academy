class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    # Find user by credentials
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # Flash errors, if any.
    # Render :new if invalid credentials (give the user another chance to login)
    if @user.nil?
      flash.now[:errors] = ['Invalid username or password.']
      render :new
    else
    # Log them in and redirect them if we find them
      login!(@user)
      redirect_to user_url(@user)
    end

  end

  def destroy
    logout!
    # redirect to login page
    redirect_to new_session_url
  end
end
