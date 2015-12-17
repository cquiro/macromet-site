class MessageMailer < ApplicationMailer
	default to: "quiroga.developer@gmail.com"
	
	def message_me(msg)
		@msg = msg

		mail from: @msg.email, subject: @msg.asunto
	end
end
