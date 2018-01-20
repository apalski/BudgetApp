class Income < ActiveRecord::Base

  validates :name, :frequency, presence: true
  validates :name, uniqueness: true
end
