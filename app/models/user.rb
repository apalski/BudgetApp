class User < ActiveRecord::Base
  has_secure_password

  has_one :budget, dependent: :destroy

  validates :name, :email, presence: true, uniqueness: true
  validates :email, confirmation: true
  validates :password, length: { in: 6..64, if: :validate_password? }

  def self.by_admin
    order(admin: :desc, name: :asc)
  end

  private

  def validate_password?
    password.present?
  end
end
