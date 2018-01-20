require "rails_helper"
require "./app/models/income"

describe Income do
  it "has a name" do
    income = Income.new(name: "Jetstar", frequency: "monthly")
    income.save!

    expect(income.name).to eq("Jetstar")
  end

  it "has no name" do
    income = Income.new(frequency: "monthly")

    expect { income.save! }
      .to raise_error("Validation failed: Name can't be blank")
  end

  it "has a unique name" do
    income = Income.new(name: "Jetstar", frequency: "monthly")
    income.save!
    income2 = Income.new(name: "Jetstar", frequency: "monthly")

    expect { income2.save! }
      .to raise_error("Validation failed: Name already taken")
  end

  it "has a frequency" do
    income = Income.new(name: "Jetstar", frequency: "monthly")
    income.save!

    expect(income.frequency).to eq("monthly")
  end

  it "has no frequency" do
    income = Income.new(name: "Jetstar")

    expect { income.save! }
      .to raise_error("Validation failed: Frequency can't be blank")
  end
end
