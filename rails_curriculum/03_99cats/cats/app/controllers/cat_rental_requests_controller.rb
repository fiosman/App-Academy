class CatRentalRequestsController < ApplicationController 

  def new
    @cats = Cat.all 
    render :new
  end

  def show
    @request = CatRentalRequest.find_by(id: params[:id])
    render :show
  end

  def create
    @request = CatRentalRequest.new(cat_rental_requests_params)

    if @request.save 
      redirect_to cat_rental_request_url(@request)
    else 
      render :new
    end
  end

  private 

  def cat_rental_requests_params 
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end