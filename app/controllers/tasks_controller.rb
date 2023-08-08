class TasksController < ApplicationController
  #READ all
  def index
    @tasks = Task.all
  end

  #READ one
  def show
    @task = Task.find(params[:id])
  end

  #CREATE 1)
  def new
    @task = Task.new
  end
  #CREATE 2)
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  #UPDATE
  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #DESTROY
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private
  #SQL SAFETY MEASURES
  def task_params
    params.require(:task).permit(:title, :details)
  end
end
