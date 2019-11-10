class CatRentalRequestsController < ApplicationController 

  def index 
  end 

  def show 
  end 

  def new
    @cats = Cat.all 
  end

  def create
  end

  private 

  def cat_rental_requests_params 
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end