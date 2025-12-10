class ItemsController < ApplicationController
  def index
      @item = Item.order("created_at DESC")
  end

  def new
     @item = Item.new 
     @categories = Category.all
     @status = Status.all
     @shipping_fees = ShippingFee.all
     @prefectures = Prefecture.all
     @scheduled_deliveries = ScheduledDelivery.all
  end
  def item_params
  params.require(:item).permit(:item_name, :price, :description, ) # :item_nameを許可する
end
end
