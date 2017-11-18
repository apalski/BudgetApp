require "rails_helper"
require "./app/models/user"

describe User do

  after do
		User.destroy_all
	end

  context User do
    user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")

    it "can create a new user" do
      expect(user).to be_a User
    end
  end

  context "when password exists" do
    user = User.create(name: "John Doe", email: "user@gmail.com", password: "secret", uid: "123")

    it "gives user a name, email, uid and password" do
      expect(user.name).to eq("John Doe")
      expect(user.email).to eq("user@gmail.com")
      expect(user.password).to eq("secret")
      expect(user.uid).to eq("123")
    end
  end

  context "when password not given" do
    user = User.new(name: "John Doe", email: "user@gmail.com", uid: "123") 

    it "raises an error" do
      expect { user.save! }.to raise_error("Validation failed: Password can't be blank")
    end
  end
end
