class Goal < ActiveRecord::Base
  belongs_to :budget

  validates :name, presence: true, uniqueness: true
  validates :due_date, :amount, presence: true

  def self.by_name
    order(name: :asc)
  end
end
