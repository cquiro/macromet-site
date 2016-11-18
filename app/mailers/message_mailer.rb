class MessageMailer < ApplicationMailer
	default to: "info@macromet.com.co"
	
	def message_me(msg)
		@msg = msg
		mail from: @msg.email, subject: @msg.asunto
	end

  def password_reset(user)
    @user = user
    mail to: "#{user.name} <#{user.email}>", 
      subject: "Restablece tu contraseña"
  end
end
