class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create] # これを追加！

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    # ...以下省略
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end