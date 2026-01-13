class OrderAddress
  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

 with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を含めて入力してください"}
    validates :prefecture_id, numericality: {other_than: 1, message: "を選択してください"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "は10桁または11桁の半角数字で入力してください"}
    validates :token, presence: true
  end
    validates :token
    # ----------------
  end

  def save
    # すべての処理を一つの塊（トランザクション）にする
    ActiveRecord::Base.transaction do
      self.phone_number = phone_number.strip if phone_number.present?
      order = Order.create!(user_id: user_id, item_id: item_id)
      
      Address.create!(
        post_code: post_code, 
        prefecture_id: prefecture_id, 
        city: city, 
        addresses: addresses, 
        building: building, 
        phone_number: phone_number, 
        order_id: order.id
      )
    end
   
end