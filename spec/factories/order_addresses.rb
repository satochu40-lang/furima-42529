# spec/factories/order_addresses.rb

FactoryBot.define do
  factory :order_address do
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    city           { '東京都' }
    addresses      { '青山1-1-1' }
    building       { '柳ビル' }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' } # 2026年現在のダミー形式
  end
end