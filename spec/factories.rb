FactoryBot.define do
  factory :budget do
    sequence(:name) { |n| "budget name#{n}" }
    user
  end

  factory :expense do
    sequence(:name) { |n| "name#{n}" }
    frequency "Weekly"
    budget
  end

  factory :income do
    sequence(:name) { |n| "name#{n}" }
    frequency "Fortnightly"
  end

  factory :user do
    sequence(:name) { |n| "user name#{n}" }
    sequence(:email) { |n| "user email#{n}" }
    password "password"

    trait :admin do
      admin true
    end
  end
end
