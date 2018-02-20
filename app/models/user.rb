class User < ActiveRecord::Base
  has_secure_password

  has_many :budgets

  validates :name, :email, presence: true, uniqueness: true

  def self.by_admin
    order(admin: :desc, name: :asc)
  end
end
