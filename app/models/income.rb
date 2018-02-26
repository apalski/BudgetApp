class Income < ActiveRecord::Base
  has_one :budget

  validates :name, presence: true, uniqueness: true
  validates :frequency, presence: true
end
