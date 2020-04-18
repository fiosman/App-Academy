class UsersController < ApplicationController
  before_action :require_not_logged_in!, only: [:create, :new]
  before_action :require_logged_in!, only: [:show]

  def create
    # sign up the user
    @user = User.new(user_params)
    if @user.save
      # redirect them to the new user's show page
      log_in!(@user)
      redirect_to feed_url
    else
      # input didn't pass validation; re-render sign up form.
      render :new
    end
  end

  def new
    # present form for signup
    @user = User.new # dummy user object
    render :new
  end

  def show
    if current_user.nil?
      # let them log in
      redirect_to new_session_url
      return
    end

    @user = User.includes(tweets: :mentioned_users).find(params[:id])
    render :show
  end

  def search
    if params[:query].present?
      @users = User.where('username ~ ?', params[:query])
    else
      @users = User.none
    end

    render :search
  end

  protected
  def user_params
    self.params.require(:user).permit(:username, :password)
  end
end
