FactoryBot.define do
  factory :review do
    overall_evaluation { Faker::Number.between(from: 1, to: 5) }
    comment            { Faker::Lorem.sentence }
    atmosphere         { Faker::Number.between(from: 1, to: 5) }
    network_stability  { Faker::Number.between(from: 1, to: 5) }
    facility           { Faker::Number.between(from: 1, to: 5) }
    congestion         { Faker::Number.between(from: 1, to: 5) }
    corona_countermeasure { Faker::Number.between(from: 1, to: 5) }
    user_id             { FactoryBot.create(:user).id }
    spot_id             { FactoryBot.create(:spot).id }
  end
end
