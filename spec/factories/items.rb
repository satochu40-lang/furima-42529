FactoryBot.define do
  factory :item do
    # 必須属性
    name             { 'テスト商品' }
    description           { 'テスト用の詳細です' }
    price                 { 5000 } # 適切な範囲内の価格
    
    # 関連付け (Active Record)
    association :user 

    # 関連付け (Active Hashモデル IDは必ず1以外を設定)
    category_id           { 2 } 
    sales_status_id       { 2 }
    shipping_fee_id       { 2 }
    prefecture_id         { 2 }
    scheduled_delivery_id { 2 }
  end
end