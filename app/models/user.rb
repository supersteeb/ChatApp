class User < ApplicationRecord
	has_secure_password

#	def authenticate(some_password)
#		sth = encrypt some_password
#		compare password_digest == sth
#	end
	validates :email, presence: true, uniqueness: { case_insensitive: true }
	validates :name, presence: true
end
