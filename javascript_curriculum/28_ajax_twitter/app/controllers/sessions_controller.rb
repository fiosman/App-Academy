class SessionsController < ApplicationController
  before_action :require_not_logged_in!, only: [:create, :new]
  before_action :require_logged_in!, only: [:destroy]

  def create
    # signs a user in
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user.nil?
      # no user with the given name!
      flash.now[:errors] = ['Invalid credentials']
      render :new
    else
      # sign the user in
      log_in!(@user)
      redirect_to feed_url
    end
  end

  def destroy
    # sign a user out
    log_out!
    redirect_to new_session_url
  end

  def new
    # presents a login form
    render :new
  end
end
