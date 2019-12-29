class GoalsController < ApplicationController 
  
  def new 
    @goal = Goal.new 
    render :new
  end

  private 

  def goal_params 
    params.require(:goal).permit(:title, :details, :completed, :visible)
  end

end