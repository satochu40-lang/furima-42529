class OrderAddress
  # 1. これを記述することで form_with や validates が使えるようになります
  include ActiveModel::Model

  # 2. 保存したいカラム（項目）をすべて定義します
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  # 3. バリデーション（入力チェック）を記述します
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
    validates :token # クレジットカード決済用のトークン
  end

  # 4. データの保存処理を記述します
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end