class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, ]
  def index
     # @items = Item.all
     #@item = Item.order("created_at DESC")
  end

 
  def new
     @item = Item.new 
     @categories = Category.all
     @sales_status = SalesStatus.all
     @shipping_fee_payer = ShippingFeePayer.all
     @prefectures = Prefecture.all
     @scheduled_deliveries = ScheduledDelivery.all
    
   end

   def create
      @item = Item.new(item_params)
      @categories = Category.all
      @sales_status = SalesStatus.all
      @shipping_fee_payer = ShippingFeePayer.all
      @prefectures = Prefecture.all
      @scheduled_deliveries = ScheduledDelivery.all
     
   if @item.save
      redirect_to root_path # 例としてトップページへ
    else
    
      render :new, status: :unprocessable_entity
    end
  end
  private
    # ... ストロングパラメータの定義 ...
  
    

    # 3. Strong Parameters（ストロングパラメータ）の定義
    #セキュリティのために、データベースに保存を許可するカラムをここで定義します。
  def item_params
    params.require(:item).permit(
      :image,                     # 画像
      :name,                      # 商品名
      :description,               # 商品説明
      :price,                     # 価格
      :category_id,               # Active Hash ID
      :sales_status_id,           # Active Hash ID
      :shipping_fee_payer_id,     # Active Hash ID
      :prefecture_id,             # Active Hash ID
      :scheduled_delivery_id      # Active Hash ID
    ).merge(user_id: current_user.id) # 💡 ログイン中のユーザーIDを付加
   end
end

