class Item < ApplicationRecord
   extend ActiveHash::Associations::ActiveRecordExtensions 
   
    belongs_to :user 
    belongs_to :category          # カテゴリー
    belongs_to :sales_status      # 商品の状態
    belongs_to :shipping_fee_payer    # 配送料の負担 (または shipping_fee_payer)
    belongs_to :prefecture        # 発送元の地域
    belongs_to :scheduled_delivery # 発送までの日数
   
    validates :image, presence: true
    validates :name, presence: true
    validates :description, presence: true
    validates :price, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9_999_999, 
    message: "は半角数字で、300円〜9,999,999円の範囲で入力してください"
  } 
   validates :category_id, presence: true
   validates :sales_status_id, presence: true
   validates :shipping_fee_payer_id, presence: true 
   validates :prefecture_id,  presence: true 
   validates :scheduled_delivery_id, presence: true 

   has_one_attached :image 
  # コメントとの関連付け
   has_many :comments, dependent: :destroy
    has_one :order

   
end  