FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
     last_name             {"山田"}
    first_name            {"太朗"}
    last_name_kana        {"ヤマダ"} 
    first_name_kana       {"タロウ"} 
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
