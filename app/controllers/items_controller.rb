# require 'Kconv'
class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params) 
    # image = item_params[:imageobject]
    # # image_name = image.original_filename
    # @item.image = image.original_filename
    # result = uploading(image, image_name)
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

    # def uploading(img_object,image_name)
    #   ext = image_name[image_name.rindex('.') + 1, 4].downcase
    #   perms = ['.jpg', '.jpeg', '.gif', '.png']
    #   if !perms.include?(File.extname(image_name).downcase)
    #     result = 'アップロードできるのは画像ファイルのみです。'
    #   elsif img_object.size > 4.megabyte
    #     result = 'ファイルサイズは4MBまでです。'
    #   else
    #     File.open("public/#{image_name.toutf8}", 'wb') { |f| f.write(img_object.read) }
    #     result = "success"
    #   end
    #   return result
    # end

    # def deleteimg(image_name)
    #   File.unlink "public/"+image_name.toutf8
    # end
end
