class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index,:show] 
    before_action :set_item, only: [:show, :edit, :update]
    before_action :move_to_index, only: [:show,:edit, :update]
  def index
     
     @items = Item.order("created_at DESC")
  end

 
  def new
     @item = Item.new 
     @categories = Category.all
     @sales_status = SalesStatus.all
     @shipping_fee_payer = ShippingFeePayer.all
     @prefectures = Prefecture.all
     @scheduled_deliveries = ScheduledDelivery.all
    
   end
      def show
      
   end

   def create
      @item = Item.new(item_params)
      @categories = Category.all
      @sales_status = SalesStatus.all
      @shipping_fee_payer = ShippingFeePayer.all
      @prefectures = Prefecture.all
      @scheduled_deliveries = ScheduledDelivery.all
     
   if @item.save
      redirect_to root_path 
    else
    
      render :new, status: :unprocessable_entity
    end
  end

    def update
   
     if @item.update(item_params)   
      redirect_to item_path(@item) 
    else
     render :edit, status: :unprocessable_entity 
  end
  end
  
  private
    def set_item
      
    end
    def move_to_index
     @item = Item.find(params[:id])

     if @item.user_id != current_user.id
      redirect_to root_path
    end
  end
  
  
    

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

