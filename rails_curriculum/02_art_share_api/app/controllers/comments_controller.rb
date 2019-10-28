class CommentsController < ApplicationController 
  
  def create 
    comment = Comment.new(comments_params) 
    
    if comment.save 
      render json: comment 
    else
      render json: comment.error.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.destroy 
      render json: comment 
    else
      render json: comment.error.full_messages, status: :unprocessable_entity
    end
  end

  def index
    if params[:user_id] 
      render json: Comment.where(user_id: params[:user_id]) 
    elsif params[:artwork_id] 
      render json: Comment.where(artwork_id: params[:artwork_id]) 
    else
      render json: Comment.all 
    end
  end

  private 

  def comments_params 
    params.require(:comment).permit(:user_id, :comment_body, :artwork_id)
  end

end