Rails.application.routes.draw do 
  devise_for :users
  root to: "items#index" 
  
  # items/index へのルーティングは必要なければ削除しても構いません
  # get 'items/index'
end
