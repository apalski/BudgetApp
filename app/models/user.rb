class User < ActiveRecord::Base
  has_many :budgets
  has_secure_password
  validates :name, :email, presence: true, uniqueness: true
end
