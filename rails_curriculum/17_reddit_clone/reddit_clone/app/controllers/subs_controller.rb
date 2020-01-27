class SubsController < ApplicationController 

  def index 
    @subs = Sub.all 
    render :index
  end 

  def show 
    @sub = Sub.find(params[:id])
    render :show
  end 

  def create
    @sub = current_user.subs.new(sub_params) 
    
  end 
  
  def new 
  end 

  def edit 
  end 

  def update 
  end

  private 

  def sub_params 
    params.require(:sub).permit(:title, :description)
  end
  
end 