class CategoriesController < ApplicationController
  before_action :set_categories, only: [:show,:edit,:update,:destroy]
  before_action :signed_in_user
  before_action :correct_user,   only: [:edit, :update,:destroy]

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
  	@category = Category.new(categories_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @category.update_attributes(categories_params)
      flash[:success] = "Category updated"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category deleted."
    redirect_to categories_path
  end

  private

  def categories_params
    params.require(:category).permit(:name,:is_active)
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user) || current_user.admin
  end

  def set_categories
    @category = Category.find(params[:id])
  end

end
