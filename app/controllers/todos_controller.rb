class TodosController < ApplicationController
  before_filter :load_todos

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def create
    @todo = Todo.new params[:todo]
    if @todo.save
      update_count
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find params[:id]
  end

  def update
    @todo = Todo.find params[:id]
    list_name = params[:todo][:list_name].parameterize
    if @todo.update_attributes params[:todo]
      @todo.update_attributes :list_name => list_name
      redirect_to @todo
    else
      render :edit
    end
  end

  private

  def load_todos
    @todos = Todo.all
  end
end
