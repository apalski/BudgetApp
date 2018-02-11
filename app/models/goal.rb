class Goal < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :due_date, :amount, presence: true
end
