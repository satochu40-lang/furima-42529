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
    validates :price, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, numericality: { other_than: 1 , message: "is not numder"}

    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :sales_status_id,numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_fee_payer_id, numericality: { other_than: 1 , message: "can't be blank"}

    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

   has_one_attached :image 
  # コメントとの関連付け
   has_many :comments, dependent: :destroy
    has_one :order

   
end  