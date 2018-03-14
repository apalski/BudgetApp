class Budget
  attr_reader :user

  delegate :expenses, :incomes, to: :user

  def initialize(user)
    @user = user
  end

  def remaining_funds
    total_income - total_expenses
  end
end
