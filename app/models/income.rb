class Income < ActiveRecord::Base
  belongs_to :budget, dependent: :destroy

  enum frequency: {
    weekly: 0, fortnightly: 1, monthly: 2, quarterly: 3, annually: 4,
  }

  validates :name, :frequency, presence: true
  validates :name, uniqueness: true
  validates :frequency, inclusion: { in: Income.frequencies.keys }

  def self.by_name
    order(name: :asc)
  end
end
