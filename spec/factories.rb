FactoryBot.define do
  factory :budget do
    sequence(:name) { |n| "budget name#{n}" }
  end

  factory :expense do
    sequence(:name) { |n| "name#{n}" }
    frequency "Weekly"
  end

  factory :income do
    sequence(:name) { |n| "name#{n}" }
    frequency "Fortnightly"
  end

  factory :user do
    sequence(:name) { |n| "user name#{n}" }
    sequence(:email) { |n| "user email#{n}" }
    password "password"
  end
end
