require "rails_helper"

describe Budget do
  context "validations" do
    subject { build(:budget) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context "associations" do
    subject { build(:budget) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:incomes).through(:budget_incomes) }
    it { is_expected.to have_many(:expenses).through(:budget_expenses) }
  end

  context "budget_type" do
    it "has a default budget type" do
      budget = Budget.new

      expect(budget.budget_type).to eq("basic")
    end

    it "defines a custom budget type" do
      budget = build(:budget, budget_type: "Ireland")

      expect(budget.budget_type).to eq("Ireland")
    end
  end
end
