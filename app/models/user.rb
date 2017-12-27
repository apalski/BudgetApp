class User < ActiveRecord::Base

  has_secure_password

	validates :name, :email, presence: true
	validates :name,:email, uniqueness: true

	def self.create_with_omniauth(auth_hash)
    user = User.find_or_create_by(uid: auth_hash["uid"])
    user.email = auth_hash["user_info"]["email"]
    user.password = SecureRandom.base64(10)
    user.name = auth_hash["user_info"]["name"]
    user.save! unless User.exists?(user.uid)
    user
	end
end
