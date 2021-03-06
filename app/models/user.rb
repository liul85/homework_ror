class User < ActiveRecord::Base
	has_secure_password
	before_save { self.email = email.downcase }
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, confirmation: true
end
