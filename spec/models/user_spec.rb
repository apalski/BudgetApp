require "rails_helper"

describe User do
  context "validations" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to have_secure_password }
  end

  context "associations" do
    it { is_expected.to have_one(:budget) }
  end

  context "admin" do
    it "is false by default" do
      expect(User.new).not_to be_admin
    end
  end
end
