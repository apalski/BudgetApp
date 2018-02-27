class Income < ActiveRecord::Base
  belongs_to :budget

  validates :name, presence: true, uniqueness: true
  validates :frequency, presence: true
end
