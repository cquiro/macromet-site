class MessageMailer < ApplicationMailer
	default to: "info@macromet.com.co"
	
	def message_me(msg)
		@msg = msg

		mail from: @msg.email, subject: @msg.asunto
	end
end
