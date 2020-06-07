class Api::TodosController < ApplicationController
  def show 
    @todo = current_user.todos.find(params[:id])
    render json: @todo 
  end 

  def index
    @todos = current_user.todos
    render json: @todos
  end 

  def create
    @todo = current_user.todos.new(todo_params) 

    if @todo.save 
      render json: @todo 
    else 
      render json: @todo.errors.full_messages, status: 422
    end
  end 

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy 
    render json: @todo 
  end 

  def update 
    @todo = current_user.todos.find(params[:id])

    if @todo.update_attributes(todo_params) 
      render json: @todo 
    else 
      render json: @todo.errors.full_messages, status: 422
    end
  end 

  private 

  def todo_params 
    params.require(:todo).permit(:body, :title, :done)
  end
end
