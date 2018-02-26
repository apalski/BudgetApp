class User < ActiveRecord::Base
  has_secure_password

  has_one :budget

  validates :name, :email, presence: true, uniqueness: true
end
