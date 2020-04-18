class FeedsController < ApplicationController
  before_action :require_logged_in!

  LIMIT = 20

  def show
    @feed_tweets =
      current_user.feed_tweets(LIMIT, params[:max_created_at]).includes(:user)

    render :show
  end
end
