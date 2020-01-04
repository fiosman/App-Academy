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
      flash[:notices] = ['Goal created!']
      redirect_to goal_url(@goal) 
    else
      flash.now[:errors] = @goal.errors.full_messages 
      render :new
    end
  end

  def edit 
    @goal = Goal.find(params[:id]) 
      if current_user == @goal.user 
        render :edit 
      else 
        flash[:notices] = ['Not your goal to edit!']
        redirect_to goal_url(@goal)
      end
  end 

  def destroy
    @goal = Goal.find(params[:id]) 
    if @goal.destroy 
      flash[:notices] = ['Goal deleted!']
    end
    redirect_to goals_url
  end 

  def update
    @goal = Goal.find(params[:id]) 

    if @goal.update_attributes(goal_params) 
      flash[:notices] = ['Goal updated!']
      if request.referer == edit_goal_url(@goal) 
        redirect_to goal_url(@goal)
      else
        redirect_to request.referer
      end
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end 

  def show 
    @goal = Goal.find(params[:id]) 
    if current_user == @goal.user
      render :show
    elsif current_user != @goal.user && @goal.visible
      render :show
    else
      flash[:notices] = ["Cannot view another user's private goals!"]
      redirect_to user_url(@goal.user) 
    end
  end

  private 

  def goal_params 
    params.require(:goal).permit(:title, :details, :completed, :visible)
  end

end