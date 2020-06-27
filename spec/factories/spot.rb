# frozen_string_literal: true

FactoryBot.define do
  factory :spot do
    sequence(:spot_name) { |n| "spot_name#{n}" }
    sequence(:spot_body) { |n| "spot_body#{n}" }
    

    trait :no_spot_name do
      title {}
    end
    
    trait :too_long_spot_name do
      body {Faker::Lorem.characters(number: 16)}
    end

    trait :no_spot_body do
      body {}
    end

    trait :too_long_spot_body do
      body {Faker::Lorem.characters(number: 100)}
    end
    
  end
end
