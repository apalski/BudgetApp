FactoryBot.define do
  factory :budget do
    sequence(:name) { |n| "budget name#{n}" }
  end
end
