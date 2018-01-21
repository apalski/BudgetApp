FactoryBot.define do
  factory :budget do
    sequence(:name) { |n| "budget name#{n}" }
  end

  factory :expense do
    sequence(:name) { |n| "name#{n}" }
    sequence(:frequency) { |n| "frequency#{n}" }
  end
end
