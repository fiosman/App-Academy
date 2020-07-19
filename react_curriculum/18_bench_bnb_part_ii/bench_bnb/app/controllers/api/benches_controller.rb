class Api::BenchesController < ApplicationController 
  def index
    @benches = params[:bounds] ? Bench.in_bounds(params[:bounds]) : Bench.all
    
    if params[:maxSeating] && params[:minSeating] 
      @benches = Bench.seating_range(params[:minSeating], params[:maxSeating])
    end
    render 'api/benches/index'
  end 

  def show 
    @bench = Bench.find(params[:id])
    render 'api/benches/show'
  end

  def create 
    @bench = Bench.new(bench_params) 

    if @bench.save 
      render 'api/benches/show'
    else 
      render json: @bench.errors.full_messages, status: 422
    end
  end 

  private 

  def bench_params 
    params.require(:bench).permit(:description, :lng, :lat, :seating, :maxSeating, :minSeating)
  end
end