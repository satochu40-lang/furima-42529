 class User < ApplicationRecord
  # Deviseの設定（この上に追記）
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #has_many :items
         #has_many :orders 
  
  # --- 独自項目のバリデーション設定 ---
  
  with_options presence: true do
    # ニックネームが必須
     validates :nick_name, presence: true

      # 生年月日が必須
    validates :birth_date

     validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers" } 
    

    # 氏名（漢字）が必須
    # 全角（漢字・ひらがな・カタカナ）で入力させるための正規表現
    validates :last_name, format:  { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
    
    # 氏名（カナ）が必須
    # 全角カタカナで入力させるための正規表現
    validates :last_name_kana, format:  { with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters" }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters" }
    

  end
  
  # --- パスワードに関するバリデーション（Deviseとは別に設定が必要な場合） ---
  # 例: パスワードは半角英数字混合で6文字以上
  # with_options, format, lengthなどを組み合わせて設定します。

end

