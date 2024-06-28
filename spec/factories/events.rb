FactoryBot.define do
  factory :event do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    date_time { Faker::Time.forward(days: 23, period: :morning) }
    location { Faker::Address.full_address }
    capacity { Faker::Number.between(from: 1, to: 100) }
    association :user
  end
end
