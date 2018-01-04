# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true
<<<<<<< HEAD
  validates :name, :email, uniqueness: true

  def self.create_with_omniauth(auth_hash)
    user = User.find_or_create_by(uid: auth_hash['uid'])
    user.email = auth_hash['user_info']['email']
=======
  validates :name,:email, uniqueness: true

  def self.create_with_omniauth(auth_hash)
    user = User.find_or_create_by(uid: auth_hash["uid"])
    user.email = auth_hash["user_info"]["email"]
>>>>>>> 2b74537335135625450d28b60e1fd6bedd0b4ba7
    user.password = SecureRandom.base64(10)
    user.name = auth_hash['user_info']['name']
    user.save! unless User.exists?(user.uid)
    user
  end
end
