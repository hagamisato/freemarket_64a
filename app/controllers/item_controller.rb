class ItemController < ApplicationController
  def index
  end

  def create
    @item.save
  end

  def new
    @item = Item.new
  end


end
