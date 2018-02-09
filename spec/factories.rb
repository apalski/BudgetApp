FactoryBot.define do
  factory :budget do
    sequence(:name) { |n| "budget name#{n}" }
    frequency :fortnightly
    user
  end

  factory :expense do
    sequence(:name) { |n| "name#{n}" }
    frequency "Weekly"
    budget
  end

  factory :income do
    sequence(:name) { |n| "name#{n}" }
    due_date "01/02/2017"
    frequency :Weekly
    bill_estimate 500
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
