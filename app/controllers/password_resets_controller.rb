class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user
      user.generate_password_reset_token!
      MessageMailer.password_reset(user).deliver_now
      redirect_to macromet_manejo_contenido_path
    else
      flash[:error] = "Ese email no está en nuestra base de datos."
      render :new
    end
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])
    
    unless @user
      render file: 'public/404.html', status: :not_found
    end
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])
    if @user && @user.update_attributes(user_params)
      @user.update_attribute(:password_reset_token, nil)
      session[:user_id] = @user.id
      flash[:success] = "La contraseña ha sido restablecida."
      redirect_to root_path
    else
      flash[:error] = "No ha sido posible restablecer la contraseña"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
