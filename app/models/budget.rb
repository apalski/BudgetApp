class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :incomes
  has_many :expenses

  validates :name, presence: true, uniqueness: true
end
