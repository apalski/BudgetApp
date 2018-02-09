require "rails_helper"

describe Expense do
  context "validations" do
    subject { build(:expense) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:frequency) }
    it { is_expected.to define_enum_for(:frequency).with(Expense.frequencies) }
  end

  context "associations" do
    it { is_expected.to belong_to(:budget).dependent(:destroy) }
  end
end
