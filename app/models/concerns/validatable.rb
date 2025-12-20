# app/models/concerns/validatable.rb

module Validatable
  # このモジュールがモデルに読み込まれたとき（includeされたとき）に実行される
  extend ActiveSupport::Concern 

  included do
    # 共通のバリデーションを定義
    validates :name, presence: true, length: { maximum: 40 }
    
    # 共通の関連付けを定義
    # belongs_to :user 
  end

  # 共通のインスタンスメソッドを定義
  def is_valid?
    self.valid?
  end
end