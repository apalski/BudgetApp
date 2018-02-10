require "rails_helper"

describe Expense do
  context "validations" do
    subject { build(:expense) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:frequency) }
  end

  context "associations" do
    subject { build(:expense) }

    it { is_expected.to have_many(:budgets).through(:budget_expenses) }
  end
end
