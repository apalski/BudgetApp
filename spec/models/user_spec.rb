require "rails_helper"
require "./app/models/user"

describe User do

  after do
		User.destroy_all
	end

  context "when all attributes are correct" do
    user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")

    it "is created" do

      expect(user).to be_a User
    end
  end

  context "when password not given" do
    user = User.new(name: "John Doe", email: "user@gmail.com", uid: "123")

    it "raises an error" do
      should validate_presence_of(:password)
    end
  end

  context "when name not given" do
    user = User.new(email: "user@gmail.com", password: "secret", uid: "123")

    it "raises an error" do
      should validate_presence_of(:name)
    end
  end

  context "when email not given" do
    user = User.create(name: "John Doe", password: "secret", uid: "123")

    it "raises an error" do
      should validate_presence_of(:email)
    end
  end

  context "when name is not unique" do
    User.destroy_all
    user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")
    user.save!
    user2 = User.create(name: "John Doe", email: "user2@gmail.com", password: "secret_sausage", uid: "124")

    it "raises an error" do
      should validate_uniqueness_of(:name)
    end
  end

  context "when email is not unique" do
    User.destroy_all
    user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")
    user.save!
    user2 = User.create(name: "Mary Doe", email: "user@gmail.com", password: "secret_sausage", uid: "124")

    it "raises an error" do
      should validate_uniqueness_of(:email)
    end
  end
end
