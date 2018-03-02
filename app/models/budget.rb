class Budget < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :incomes
  has_many :expenses

  enum frequency: [:Weekly, :Fortnightly, :Monthly]

  validates :name, presence: true
  validates :frequency, presence: true
  validates :frequency, inclusion: { in: Budget.frequencies.keys }
end
