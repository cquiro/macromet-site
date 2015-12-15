class MessageMailer < ApplicationMailer
	default to: "quiroga.developer@gmail.com"
	
	def message_me(msg)
		@msg = msg

		mail from: @msg.email, subject: @msg.asunto, body: @msg.mensaje
	end
end
