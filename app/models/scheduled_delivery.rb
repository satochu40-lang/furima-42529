class ScheduledDelivery < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1〜2日で発送' },
    { id: 3, name: '2〜3日で発送' },
    { id: 4, name: '4〜7日で発送' }
    # 必要に応じて他の選択肢を追加
  ]
  include ActiveHash::Associations
  has_many :items 
end