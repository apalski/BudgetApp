class User < ActiveRecord::Base
  has_secure_password

  has_many :budgets

  validates :name, :email, presence: true, uniqueness: true

  def self.list_users
    User.all.order(admin: :desc, name: :asc)
  end
end
