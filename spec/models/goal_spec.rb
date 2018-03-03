require "rails_helper"

describe Goal do
  context "validations" do
    subject { build(:goal) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:due_date) }
    it { is_expected.to validate_presence_of(:amount) }
  end

  context "associations" do
    it { is_expected.to belong_to(:budget) }
  end

  context ".by_name" do
    it "orders by goal name" do
      goal1 = create(:goal, name: "Retirement")
      goal2 = create(:goal, name: "Apartment")
      goal3 = create(:goal, name: "Holiday")

      expect(Goal.by_name).to eq [goal2, goal3, goal1]
    end
  end
end
