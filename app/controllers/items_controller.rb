# require 'Kconv'
class ItemsController < ApplicationController
before_action :set_item, only:[:edit, :update]

  def index
    @items = Item.limit(10).order('id DESC')
  end

  def new
    @item = Item.new
    @item.images.build
    @item.categories.build
  end

  def create 
    @item = Item.new(item_params)
    render :new unless @item.save
  end

  def show
    @image = Image.last
    @item = Item.last
  #  エラーが出たためコメントアウトしました。
  #   @category = Category.last
  #   @item = Item.find(params[:id])
  #   @image = Image.find_by(item_id: @item.id)
  #   @category = Category.find_by(item_id: @item.id)
  # エラーが出るためコメントアウトーーーーーー柴田さんの記述に合わせて変更
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else 
      redirect_to edit_item_path(@item.id) 
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      redirect_to edit_item_path(@item.id) 
    end
  end

  private
  
  def item_params 
    params.require(:item).permit(:name, :explain, :state, :postage, :shipping_area, :shipping_date, :price, images_attributes: [:id, :image, :item_id], categories_attributes: [:id, :name, :item_id, :category_name])
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
