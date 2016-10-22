class User < ApplicationRecord
	has_secure_password

	has_many :friendships, dependent: :destroy #user has many friendships which can be deleted/destroyed
	has_many :friends, :through => :friendships #cannot delete the friend, but can delete the friendship
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user

	has_many :messages

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
		Message.where(receipient: self)
	end

	def latest_received_messages(n)
		received_messages.order(created_at: :desc).limit(n)
	end

	def unread_messages
		received_messages.unread
	end

	def mark_as_read!
		self.read_at = Time.now
		save!
	end
	
end
