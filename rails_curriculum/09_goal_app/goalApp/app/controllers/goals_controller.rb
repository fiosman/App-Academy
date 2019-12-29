class GoalsController < ApplicationController 
  
  def new 
    @goal = Goal.new 
    render :new
  end

  def index 
    @goals = current_user.goals 
    render :index
  end

  def create 

  end

  def edit 
  end 

  def destroy
  end 

  def update
  end 

  private 

  def goal_params 
    params.require(:goal).permit(:title, :details, :completed, :visible)
  end

end