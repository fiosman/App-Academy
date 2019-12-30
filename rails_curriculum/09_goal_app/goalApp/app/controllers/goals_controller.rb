class GoalsController < ApplicationController 
  before_action :require_log_in!

  def new 
    @goal = Goal.new 
    render :new
  end

  def index 
    @goals = current_user.goals 
    render :index
  end

  def create 
    @goal = current_user.goals.new(goal_params) 

    if @goal.save 
      flash[:notices] = ['Goal saved!']
      redirect_to goal_url(@goal) 
    else
      flash.now[:errors] = @goal.errors.full_messages 
      render :new
    end
  end

  def edit 
    @goal = Goal.find(params[:id]) 
    render :edit
  end 

  def destroy
    @goal = Goal.find(params[:id]) 
    @goal.destroy 
    redirect_to goals_url
  end 

  def update
    @goal = Goal.find(params[:id]) 

    if @goal.update_attributes(goal_params) 
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end 

  def show 
    @goal = Goal.find(params[:id])
    render :show
  end

  private 

  def goal_params 
    params.require(:goal).permit(:title, :details, :completed, :visible)
  end

end