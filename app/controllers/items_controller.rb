# require 'Kconv'
class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params) 
    if @item.save
      redirect_to '/'
    else
      redirect_to '/items/new'
    end
  end

  def new
    @item = Item.new
    # @item.build_categories
    # @item.build_images
  end

  private
    def item_params
      params.require(:item).permit(:name, :explain, :state, :postage, :shipping_area, :shipping_date, :price, categories_attributes:[:id, :name, :item_id])
    end
    
end
