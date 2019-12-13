class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params) 
    @item.save
    redirect_to '/'
  end

  def new
    @item = Item.new
    # @item.build
  end

  private
    def item_params
      params.require(:item).permit(:image, :name, :explain, :state, :postage, :shipping_area, :shipping_date, :price)
    end
end
