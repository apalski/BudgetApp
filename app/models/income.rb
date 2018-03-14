class Income < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :frequency, presence: true
end
