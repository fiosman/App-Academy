class SubsController < ApplicationController 

  before_action :verify_moderator, only: [:edit, :update]

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

    if @sub.save 
      flash[:notices] = ['Sub successfully created!']
      redirect_to sub_url(@sub) 
    else 
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end 
  
  def new 
    @sub = Sub.new 
    render :new
  end 

  def edit 
    @sub = Sub.find(params[:id]) 
    render :edit 
  end 

  def update 
    @sub = Sub.find(params[:id]) 
    
    if @sub.update_attributes(sub_params)
      flash[:notices] = ['Sub successfully updated']  
      redirect_to sub_url(@sub)  
    else 
      flash.now[:errors] = @sub.errors.full_messages 
      render :edit 
    end
  end

  private 

  def sub_params 
    params.require(:sub).permit(:title, :description)
  end

  def verify_moderator
    sub = Sub.find(params[:id]) 

    if current_user != sub.moderator 
      flash[:notices] = ['Cannot modify a sub you do not own!']
      redirect_to request.referer
    end
  end
  
end 