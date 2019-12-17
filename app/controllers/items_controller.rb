# require 'Kconv'
class ItemsController < ApplicationController


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
    @category = Category.last
  end

  # def show
  #   @item = Item.find(params[:id])
  # end
  # Couldn't find Item with 'id'=idというエラーが出たためコメントアウトしました。

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end

  private
  
  def item_params 
    params.require(:item).permit(:name, :explain, :state, :postage, :shipping_area, :shipping_date, :price, images_attributes: [:id, :image, :item_id], categories_attributes: [:id, :name, :item_id, :category_name])
  end
  
  def set_item
    
  end
end
