class MessagesController < ApplicationController
  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params)

  	if @message.valid?
      MessageMailer.message_me(@message).deliver_now
  		redirect_to contacto_path, notice: "Gracias por contactarnos. Pronto nos comunicaremos con usted."
  	else
      flash[:alert] = "Su mensaje no se pudo enviar. Por favor intente de nuevo."
  		render :new
  	end
  end

  private

  def message_params
  	params.require(:message).permit(:nombre, :email, :asunto, :mensaje)
  end
end
