class Budget < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :incomes
  has_many :expenses

  validates :name, presence: true
end
