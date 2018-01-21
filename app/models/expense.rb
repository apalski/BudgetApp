class Expense < ActiveRecord::Base

  validates :name, :frequency, presence: true
  validates :name, uniqueness: true
end
