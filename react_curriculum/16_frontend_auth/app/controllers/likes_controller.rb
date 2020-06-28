# This class doesn't make a whole lot of sense unless there's a logged
# in user. We're going to go ahead and skip the views for this for now.

class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user_id = current_user.id
    @like.chirp_id = params[:id]
    unless @like.save
      flash[:errors] = @like.errors.full_messages
    end
    redirect_to chirp_url(params[:id])
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to chirp_url(@like.chirp_id)
  end
end
