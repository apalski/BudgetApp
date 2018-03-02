require "rails_helper"

describe Budget do
  context "validations" do
    subject { build(:budget) }

    it { is_expected.to validate_presence_of(:name) }
  end

  context "associations" do
    it { is_expected.to belong_to(:user).dependent(:destroy) }
    it { is_expected.to have_many(:incomes) }
    it { is_expected.to have_many(:expenses) }
  end
end
