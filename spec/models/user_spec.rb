require "rails_helper"
require "./app/models/user"

describe User do

  context "when all attributes are correct" do

    it "is created" do
      user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")

      expect(user).to be_a User
    end
  end

  context "when password not given" do

    it "raises an error" do
      user = User.create(name: "John Doe", email: "user@gmail.com", uid: "123")

      expect { user.save! }.to raise_error("Validation failed: Password can't be blank")
    end
  end

  context "when name not given" do

    it "raises an error" do
      user = User.create(email: "user@gmail.com", password: "secret", uid: "123")

      expect { user.save! }.to raise_error("Validation failed: Name can't be blank")
    end
  end

  context "when email not given" do

    it "raises an error" do
      user = User.create(name: "John Doe", password: "secret", uid: "123")

      expect { user.save! }.to raise_error("Validation failed: Email can't be blank")
    end
  end

  context "when name is not unique" do

    it "raises an error" do
      user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")
      user.save!
      user2 = User.create(name: "John Doe", email: "user2@gmail.com", password: "secret_sausage", uid: "124")

      expect { user2.save! }.to raise_error("Validation failed: Name has already been taken")
    end
  end

  context "when email is not unique" do

    it "raises an error" do
      user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")
      user.save!
      user2 = User.create(name: "Mary Doe", email: "user@gmail.com", password: "secret_sausage", uid: "124")

      expect { user2.save! }.to raise_error("Validation failed: Email has already been taken")
    end
  end
end
