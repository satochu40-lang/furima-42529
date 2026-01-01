Rails.application.routes.draw do 
  devise_for :users
  root to: "items#index" 

  # すでに作成済みの機能(new, createなど)を維持しつつ、
  # その中に購入機能(orders)をネストさせます
  resources :items, only: [:new, :create, :show, :edit, :update] do
    resources :orders, only: [:index, :create]
  end
end