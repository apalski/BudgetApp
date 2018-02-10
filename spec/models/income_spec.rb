require "rails_helper"

describe Income do
  context "validations" do
    subject { build(:income) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:frequency) }
  end

  context "associations" do
    subject { build(:income) }

    it { is_expected.to have_many(:budgets).through(:budget_incomes) }
  end
end
