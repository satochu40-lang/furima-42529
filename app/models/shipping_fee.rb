class ShippingFee < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い（購入者負担）' },
    { id: 3, name: '送料込み（出品者負担）' }
    # 必要に応じて他の選択肢を追加
  ]

  # Itemモデルとの関連付け（has_many）のために、以下を記述します
  include ActiveHash::Associations
  has_many :items 
end