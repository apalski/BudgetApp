class User < ActiveRecord::Base

  has_secure_password

	validates :name, :email, presence: true
	validates :name,:email, uniqueness: true

	# Creates a new Facebook user if they don't already exist
	def self.create_with_omniauth(auth_hash)
	    user = User.find_or_create_by(uid: auth_hash["uid"])
	    user.email = auth_hash["info"]["email"]
	    user.password = SecureRandom.base64(10)
	    user.name = auth_hash["info"]["name"]
	    if User.exists?(user)
	    	user
	    else
	    	user.save!
	    	user
	    end
  	end
end
