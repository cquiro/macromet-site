class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.generate_password_reset_token!
    MessageMailer.password_reset(user).deliver_now
    redirect_to macromet_manejo_contenido_path
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])
    
    unless @user
      render file: 'public/404.html', status: :not_found
    end
  end
end
