class Api::ReviewsController < ApplicationController 

  def create 
    @review = current_user.reviews.new(review_params) 

    if @review.save 
      render 'api/reviews/show'
    else
      render json: errors.full_messages, status: 422
    end
  end

  private

  def review_params 
    params.require(:review).permit(:body, :bench_id, :rating)
  end
end