class Message < ApplicationRecord
	belongs_to :sender, class_name: 'User', foreign_key: :sender_id
	belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id

	scope :unread, -> {where(read_at: nil)}


	def mark_as_read!
		self.read_at ||= Time.now
		save!
	end

	def read?
		read_at
	end

end
