class TasksController < ApplicationController
  before_action :is_logged_in
  before_action :get_category, except: [:index, :today, :new]
  
  def index
    if params[:category_id] != nil
      redirect_to categories_path
    end
    @tasks = current_user.tasks
  end
  def today
    @tasks = current_user.tasks.where(deadline: Date.today)
  end
  def new
    if params[:category_id] != nil
      get_category()
      @task = @category.tasks.build
    end
  end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_path(params[:category_id])
    else
      if params[:from_dropdown] != nil
        flash[:notice] = "Please fill out the required fields."
        redirect_to new_task_path
      else
        render :new
      end
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
