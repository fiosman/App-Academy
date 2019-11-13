class CatRentalRequestsController < ApplicationController 

  def new
    @cats = Cat.all 
    render :new
  end

  def create
    @cat = Cat.find_by(id: cat_rental_request_params[:cat_id])
    @request = CatRentalRequest.new(cat_rental_request_params)

    if @request.save 
      redirect_to cat_url(@cat)
    else 
      render :new
    end
  end

  def approve
    @request = CatRentalRequest.find_by(id: params[:id])
    @request.approve! 
  end

  def deny 
    @request = CatRentalRequest.find_by(id: params[:id])
    @request.deny!
  end

  private 

  def cat_rental_request_params 
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end