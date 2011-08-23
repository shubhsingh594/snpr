class Message < ActiveRecord::Base
	# from http://stackoverflow.com/questions/5141564/model-users-message-in-rails-3
	belongs_to :user

	scope :sent, where(:sent => true)
	scope :received, where(:sent => false)

	# note: messages are cloned so that copies are kept on delete
	def send_message(from, recipient)
		msg = self.clone
		# false means that the message was received,
		# true means that the message was sent
		msg.user_id = recipient.id
		msg.sent = false
		msg.to_id = recipient.id
		msg.from_id = from.id
		msg.save

		self.update_attributes :from_id => from.id, :sent => true, :to_id => recipient.id
	end
end