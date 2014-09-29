class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, confirmation: true
end
