FactoryBot.define do
  factory :review do
    overall_evaluation {Faker::Number.between(from: 1, to: 6)}
    comment            {Faker::Lorem.sentence}
    atmosphere         {Faker::Number.between(from: 1, to: 6)}
    network_stability  {Faker::Number.between(from: 1, to: 6)}
    facility           {Faker::Number.between(from: 1, to: 6)}
    congestion         {Faker::Number.between(from: 1, to: 6)}
    corona_countermeasure {Faker::Number.between(from: 1, to: 6)}
    association :user 
  end
end
