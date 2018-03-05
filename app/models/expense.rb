class Expense < ActiveRecord::Base
  belongs_to :budget, dependent: :destroy

  enum frequency: [:weekly, :fortnightly, :monthly, :quarterly, :annually]

  validates :name, :frequency, presence: true
  validates :name, uniqueness: true
  validates :frequency, inclusion: { in: Expense.frequencies.keys }

  def self.by_name
    order(name: :asc)
  end
end
