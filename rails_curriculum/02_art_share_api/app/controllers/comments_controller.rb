class CommentsController < ApplicationController 
  
  def create 
  end

  def destroy
  end

  def index
    render json: Comment.all 
  end
end