require "rails_helper"

describe Budget do
  context "validations" do
    subject { build(:budget) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:frequency) }
    it { is_expected.to define_enum_for(:frequency).with(Budget.frequencies) }
  end

  context "associations" do
    it { is_expected.to belong_to(:user).dependent(:destroy) }
    it { is_expected.to have_many(:incomes) }
    it { is_expected.to have_many(:expenses) }
  end
end
