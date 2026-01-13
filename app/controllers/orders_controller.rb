class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create] 
  before_action :move_to_index, only: [:index, :create]

  def index
  @order_address = OrderAddress.new
  @item = Item.find(params[:item_id])

  # --- これが絶対に必要です！ ---
  gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  # ----------------------------
end

  def create
    @order_address = OrderAddress.new(order_params)
  

   if @order_address.valid?
    if Rails.env.development?
      OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
      OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    end
      OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,           
      card: order_params[:token],    
      currency: 'jpy'                
    )

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
  def move_to_index

   if current_user.id == @item.user_id # || @item.order.present?
    redirect_to root_path
   end
end
  def order_params
  
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end
end