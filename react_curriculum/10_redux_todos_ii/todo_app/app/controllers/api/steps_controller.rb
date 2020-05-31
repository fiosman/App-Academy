class Api::StepsController < ApplicationController 
  def show 
    @step = Step.find(params[:id])
    render json: @step
  end 

  def index 
    @steps = Step.where(todo_id: params[:todo_id])
    render json: @steps
  end

  def create
    @step = Step.new(step_params)

    if @step.save 
      render json: @step 
    else 
      render json: @step.errors.full_messages, status: 422 
    end
  end 

  def update
    @step = Step.find(params[:id])

    if @step.update_attributes(step_params) 
      render json: @step 
    else 
      render json: @step.errors.full_messages, status: 422
    end
  end 

  def destroy
    @step = Step.find(paarams[:id]).destroy
    render json: @step
  end 

  private

  def step_params
    params.require(:step).permit(:body, :title, :todo_id, :done)
  end
end