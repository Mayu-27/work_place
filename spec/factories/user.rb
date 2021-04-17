FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'test000' }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    kana_last_name        { person.last.katakana }
    kana_first_name       { person.first.katakana }
    birth_date            { Faker::Date.birthday }
  end
end
