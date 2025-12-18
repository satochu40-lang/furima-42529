FactoryBot.define do
  factory :item do
    # --- 1. ここは「属性」を書く場所 ---
    name                  { 'テスト商品' }
    description           { 'テスト用の詳細です' }
    price                 { 5000 }
    category_id           { 2 } 
    sales_status_id       { 2 }
    shipping_fee_payer_id       { 2 }
    prefecture_id         { 2 }
    scheduled_delivery_id { 2 }

    # --- 2. 関連付け ---
    association :user 

    # --- 3. 画像添付（独立したブロックにする） ---
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end # 👈 ここでafter(:build)をしっかり閉じる
  end
end