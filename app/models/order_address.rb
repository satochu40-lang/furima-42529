class OrderAddress
  include ActiveModel::Model # モデルのように振る舞わせる魔法の言葉

  # 保存したい項目をすべて書き出す（attr_accessor）
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  # ここにバリデーション（空欄チェックなど）を書く
  # ここに save メソッドを書く
end