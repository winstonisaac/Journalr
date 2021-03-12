class CategoriesController < ApplicationController
  before_action :is_logged_in

  def index
    @categories = current_user.categories
  end

  def new
    @category = current_user.categories.build
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end
  
  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end
  
  private
  
  def is_logged_in
    if current_user == nil
      redirect_to root_path
    end
  end

  def category_params
    params.require(:category).permit(:name, :details)
  end
end
