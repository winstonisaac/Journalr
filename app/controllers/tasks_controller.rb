class TasksController < ApplicationController
  before_action :is_logged_in
  before_action :get_category
  
  def index
    
  end

  def new
    @task = @category.tasks.build
  end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_path(params[:category_id])
    else
      render :new
    end
  end
  
  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_path(params[:category_id])
    else
      render :edit
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
  end

  private

  def is_logged_in
    if current_user == nil
      redirect_to root_path
    end
  end

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :details, :deadline)
  end
end
