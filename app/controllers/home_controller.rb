class HomeController < ApplicationController
  before_action :is_logged_in
  def index
  end

  private
  
  def is_logged_in
    if current_user != nil
      redirect_to categories_path
    end
  end
end
