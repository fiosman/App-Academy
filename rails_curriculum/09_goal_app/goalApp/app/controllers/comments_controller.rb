class CommentsController < ApplicationController 
  before_action :require_log_in!

  def create 
    @comment = Comment.new(comment_params) 
    @comment.author_id = current_user.id     
    
    if @comment.save 
      flash[:notices] = ['Comment saved'] 
      redirect_to request.referrer
    else 
      flash[:errors] = @comment.errors.full_messages
    end
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
  end
end 