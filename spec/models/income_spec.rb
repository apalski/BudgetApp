require "rails_helper"

describe Income do
  context "validations" do
    subject { build(:income) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:frequency) }
    it { is_expected.to define_enum_for(:frequency).with(Income.frequencies) }
  end

  context "associations" do
    it { is_expected.to belong_to(:budget) }
  end

  context ".by_name" do
    it "orders by income name" do
      income1 = create(:income, name: "Wages")
      income2 = create(:income, name: "Age Pension")
      income3 = create(:income, name: "Salary")

      expect(Income.by_name).to eq [income2, income3, income1]
    end
  end
end
