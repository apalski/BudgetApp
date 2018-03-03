class Income < ActiveRecord::Base
  belongs_to :budget

  budget_amounts = {
    Weekly: 1,
    Fortnightly: 2,
    Monthly: 4,
    Quarterly: 13,
    Annual: 52,
  }

  validates :name, presence: true, uniqueness: true
  validates :frequency, presence: true
end
