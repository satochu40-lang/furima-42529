class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create] # これを追加！

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
  

   if @order_address.valid?
      @order_address.save # ここでステップ1のsaveメソッドが動きます
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  def order_params
    # フォームから送られてくる情報を許可する設定です
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end
end