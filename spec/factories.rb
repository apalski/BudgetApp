FactoryBot.define do
  factory :income do
    sequence(:name) { |n| "name#{n}" }
    sequence(:frequency) { |n| "frequency#{n}" }
  end

  factory :expense do
    sequence(:name) { |n| "name#{n}" }
    sequence(:frequency) { |n| "frequency#{n}" }
  end

  factory :user do
    sequence(:name) { |n| "user name#{n}" }
    sequence(:email) { |n| "user email#{n}" }
  end
end
