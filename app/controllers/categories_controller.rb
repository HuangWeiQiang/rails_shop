class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @submit_data = Hash.new
    @submit_data = {name:nil, parent_name:nil, introduction:nil, picture_addr:nil}
    @category = Category.new
    submit_data = new_category_param
    parent_category = Category.find_by(name: submit_data[:parent_name])
    if parent_category

      @category.name = submit_data[:name]
      @category.parent_id = parent_category.id
      @category.level = parent_category.level + 1
      @category.introduction = submit_data[:introduction]
      @category.save
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
  private
  def new_category_param
    params.require(:category).permit(:name, :parent_name, :picture_addr, :introduction)
  end

  def update_category_param
    params.require(:category).permit(:name, :parent_id, :level, :picture_addr, :introduction)
  end
end
