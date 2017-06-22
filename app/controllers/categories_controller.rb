class CategoriesController < ApplicationController
  before_action :set_category, only: []
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
    @category = Category.find(params[:id])
    @parent_category = Category.find(@category.parent_id)
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(update_category_param)
    redirect_to @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
  private
  def new_category_param
    params.require(:category).permit(:name, :parent_name, :picture_addr, :introduction)
  end

  def update_category_param
    params.require(:category).permit(:name, :parent_id, :level, :picture_addr, :introduction)
  end
end
