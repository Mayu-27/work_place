FactoryBot.define do
  factory :spot do
    shop_name          {Faker::Name}
    address            {Faker::Address.street_address}
    phone_number       {Faker::Number.number(9)}
    opening_hours      {"10:00~22:00"}
    non_business_day   {"日曜日"}
    latitude           {Faker::Address.latitude}
    longitude          {Faker::Address.longitude}
  end
end
