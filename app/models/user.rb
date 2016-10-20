class User < ApplicationRecord
	has_secure_password

	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	 	

#	def authenticate(some_password)
#		sth = encrypt some_password
#		compare password_digest == sth
#	end
	validates :email, presence: true, uniqueness: { case_insensitive: true }
	validates :name, presence: true

	def sent_messages
		Message.where(sender_id: id)
	end

	def received_messages
		Message.where(receipient_id: id)
	end
	
end
