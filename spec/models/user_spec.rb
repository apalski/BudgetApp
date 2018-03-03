require "rails_helper"

describe User do
  context "validations" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_confirmation_of(:email) }
    it { is_expected.to validate_length_of(:password).
      is_at_least(6).
      is_at_most(64)
    }
    it { is_expected.to have_secure_password }
  end

  context "associations" do
    it { is_expected.to have_one(:budget).dependent(:destroy) }
  end

  context "admin" do
    it "is false by default" do
      expect(User.new).not_to be_admin
    end
  end

  context ".by_admin" do
    it "orders admin first, then by user's name" do
      user1 = create(:user, name: "Zane")
      user2 = create(:user, name: "Abel")
      admin = create(:user, :admin, name: "Mildred")

      expect(User.by_admin).to eq [admin, user2, user1]
    end
  end
end
