class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params) 
    @item.save
  end

  def new
    @item = Item.new
    @item.images.build
  end

  private
  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :state, :postage, :shipping_area, :shipping_date, :price, images_attributes:[:id, :image])
  end
end
