FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'test000'}
    password_confirmation {password}
    last_name             {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
    kana_last_name        {'ヤマダ'}
    kana_first_name       {'タロウ'}
    birth_date            {Faker::Date.birthday}
  end
end