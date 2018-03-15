FactoryBot.define do
  factory :expense do
    bill_estimate 100
    due_date "01/05/2018"
    frequency :weekly
    sequence(:name) { |n| "name#{n}" }
    user
  end

  factory :income do
    frequency :fortnightly
    sequence(:name) { |n| "name#{n}" }
    user
  end

  factory :user do
    password "password"
    sequence(:name) { |n| "user name#{n}" }
    sequence(:email) { |n| "user email#{n}" }

    trait :admin do
      admin true
    end
  end
end
