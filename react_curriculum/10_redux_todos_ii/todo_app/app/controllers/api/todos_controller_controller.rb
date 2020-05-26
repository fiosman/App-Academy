class Api::TodosControllerController < ApplicationController
  def show 
    @todo = Todo.find(params[:id])
    render json: @todo 
  end 

  def index
    @todos = Todo.all 
    render json: @todos
  end 

  def create
    @todo = Todo.new(todo_params) 

    if @todo.save 
      render json: @todo 
    else 
      render json: @todo.errors.full_messages
    end
  end 

  def destroy
    @todo = Todo.find(params[:id])
    
    if @todo.destroy 
      render json: 'Todo deleted.'
    else 
      render json: @todo
    end
  end 

  def update 
    @todo = Todo.find(params[:id])

    if @todo.update_attributes(todo_params) 
      render json: @todo 
    else 
      render json: @todo.errors.full_messages
    end
  end 

  private 

  def todo_params 
    params.require(:todo).permit(:body, :title, :done)
  end
end
