class Expense < ActiveRecord::Base
  belongs_to :budget, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :frequency, presence: true
end
