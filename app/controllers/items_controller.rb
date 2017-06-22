class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :edit, :show, :update]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_param)
    @item.category_id = params[:category_id]
    @item.save
    redirect_to category_items_path(params[:category_id])
  end

  def show
    @category = Category.find(params[:category_id])
  end

  def index
    @category = Category.find(params[:category_id])
    @items = @category.items
  end

  def edit

  end

  def update
    @item.update(item_param)
    @item.save
    redirect_to category_items_path(category_id: @item.category_id)
  end

  def destroy
    category_id = @item.category_id
    @item.destroy
    redirect_to category_items_path(category_id)
  end
  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_param
    params.require(:item).permit(:name, :price, :picture_addr, :introduction)
  end
end
