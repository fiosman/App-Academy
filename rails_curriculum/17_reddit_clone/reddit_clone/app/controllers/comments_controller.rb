class CommentsController < ApplicationController 

  def create 
    @comment = current_user.comments.
  end

  def new 
    @comment = Comment.new 
    render :new
  end 

  def comment_params 
    params.require(:comment).permit(:content, :post_id)
  end
end