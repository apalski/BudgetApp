FactoryBot.define do
  factory :expense do
    sequence(:name) { |n| "name#{n}" }
    frequency :weekly
    due_date "01/05/2018"
    user
  end

  factory :income do
    sequence(:name) { |n| "name#{n}" }
    frequency :fortnightly
    user
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
