class Expense < ActiveRecord::Base
  belongs_to :budget, dependent: :destroy

  enum frequency: {
    weekly: 0,
    fortnightly: 1,
    monthly: 2,
    quarterly: 3,
    annually: 4,
  }

  validates :bill_estimate, :due_date, :frequency, :name, presence: true
  validates :name, uniqueness: true
  validates :frequency, inclusion: { in: Expense.frequencies.keys }

  def self.by_name
    order(name: :asc)
  end
end
