# require 'Kconv'
class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.images.build
    @item.categories.build
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      
    else
      render :new
    end   
  end

  def show
    @image = Image.last
    @item = Item.last
    @category = Category.last
  end

  private
  
  def item_params 
    params.require(:item).permit(:name, :explain, :state, :postage, :shipping_area, :shipping_date, :price, images_attributes: [:id, :image, :item_id], categories_attributes: [:id, :name, :item_id, :category_name])
  end  
end
