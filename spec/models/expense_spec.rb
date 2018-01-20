require "rails_helper"
require "./app/models/expense"

describe Expense do
  it "has a name" do
    expense = Expense.create(name: "electricity", frequency: "monthly")
    expense.save!

    expect(expense.name).to eq("electricity")
  end

  it "has no name" do
    expense = Expense.create(frequency: "monthly")

    expect { expense.save! }
      .to raise_error("Validation failed: Name can't be blank")
  end

  it "has a unique name" do
    expense = Expense.create(name: "gas", frequency: "monthly")
    expense.save!
    expense2 = Expense.create(name: "gas", frequency: "monthly")

    expect { expense2.save! }
      .to raise_error("Validation failed: Name already taken")
  end

  it "has a frequency" do
    expense = Expense.create(name: "electricity", frequency: "monthly")
    expense.save!

    expect(expense.frequency).to eq("monthly")
  end

  it "has no frequency" do
    expense = Expense.new(name: "petrol")

    expect { expense.save! }
      .to raise_error("Validation failed: Frequency can't be blank")
  end
end
