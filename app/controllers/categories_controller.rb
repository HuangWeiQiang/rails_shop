class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    submit_data = new_category_param
    parent_category = Category.find_by(name: submit_data[:parent_name])
    if parent_category
      @category.name = submit_data[:name]
      @category.parent_id = parent_category.id
      @category.level = parent_category.level + 1
      @category.introduction = submit_data[:introduction]
      @category.save!
    else

    end
    redirect_to @category
  end

  def show
    @parent_category = Category.find(@category.parent_id)
  end

  def index
    @categories = Category.all
  end

  def edit

  end

  def update
    @category.update(update_category_param)
    redirect_to @category
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def new_category_param
    params.require(:category).permit(:name, :parent_name, :picture_addr, :introduction)
  end

  def update_category_param
    params.require(:category).permit(:name, :parent_id, :level, :picture_addr, :introduction)
  end
end
