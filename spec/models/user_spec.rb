require "rails_helper"

describe User do
  context "validations" do
    it do
      build(:user, email: "user@gmail.com")

      should validate_presence_of(:name)
    end

    it do
      build(:user, name: "John Doe")

      should validate_presence_of(:email)
    end

    it do
      create(:user, name: "John Doe", email: "user@gmail.com")
      build(:user, name: "John Doe", email: "user2@gmail.com")

      should validate_uniqueness_of(:name)
    end

    it do
      create(:user, name: "John Doe", email: "user@gmail.com")
      build(:user, name: "Mary Doe", email: "user@gmail.com")

      should validate_uniqueness_of(:email)
    end
  end
end
