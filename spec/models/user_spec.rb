require "rails_helper"
require "./app/models/user"

describe User do
  context "when all attributes are correct" do
    it "is created" do
      user = User.create(name: "John Doe",
                         email: "user@gmail.com")

      expect(user).to be_a User
    end
  end

  context "when name not given" do
    it "raises an error" do
      user = User.create(email: "user@gmail.com")

      expect { user.save! }
        .to raise_error("Validation failed: Name must be entered")
    end
  end

  context "when email not given" do
    it "raises an error" do
      user = User.create(name: "John Doe")

      expect { user.save! }
        .to raise_error("Validation failed: Email must be entered")
    end
  end

  context "when name is not unique" do
    it "raises an error" do
      user = User.create(name: "John Doe",
                         email: "user@gmail.com")
      user.save!
      user2 = User.create(name: "John Doe",
                          email: "user2@gmail.com")

      expect { user2.save! }
        .to raise_error("Validation failed: Name already taken")
    end
  end

  context "when email is not unique" do
    it "raises an error" do
      user = User.create(name: "John Doe",
                         email: "user@gmail.com")
      user.save!
      user2 = User.create(name: "Mary Doe",
                          email: "user@gmail.com")

      expect { user2.save! }
        .to raise_error("Validation failed: Email already taken")
    end
  end
end
