require "rails_helper"

describe Goal do
  context "validations" do
    subject { build(:goal) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:due_date) }
    it { is_expected.to validate_presence_of(:amount) }
  end
end
