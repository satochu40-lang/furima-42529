 class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :orders 
  
   with_options presence: true do
    
     validates :nick_name, presence: true
      
    validates :birth_date

     validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers" } 
    
    validates :last_name, format:  { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
    
    
    validates :last_name_kana, format:  { with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters" }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters" }
    
  end
end

