require "rails_helper"

describe Expense do
  context "validations" do
    subject { build(:expense) }

    it { is_expected.to validate_presence_of(:bill_estimate) }
    it { is_expected.to validate_presence_of(:due_date) }
    it { is_expected.to validate_presence_of(:frequency) }
    it { is_expected.to define_enum_for(:frequency).with(Expense.frequencies) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context "associations" do
    it { is_expected.to belong_to(:user).dependent(:destroy) }
  end

  context "frequency has a default value" do
    it "should be weekly" do
      expense = build(:expense)

      expect(expense.frequency).to eq("weekly")
    end
  end

  context ".by_name" do
    it "orders by expense name" do
      expense1 = create(:expense, name: "Gas")
      expense2 = create(:expense, name: "Electricity")
      expense3 = create(:expense, name: "Food")

      expect(Expense.by_name).to eq [expense2, expense3, expense1]
    end
  end
end
