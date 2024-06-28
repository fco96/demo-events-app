# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    date_time { Faker::Time.forward(days: 23, period: :morning) }
    location { Faker::Address.full_address }
    capacity { Faker::Number.between(from: 1, to: 100) }
    association :user

    trait :past do
      date_time { Faker::Time.backward(days: 23, period: :morning) }
    end
  end
end
