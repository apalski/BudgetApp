require "rails_helper"

describe Budget do
  context "validations" do
    subject { build(:budget) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
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
