class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "Has iniciado sesión"
      redirect_to contenido_path
    else
      flash[:error] = "Revisa tu usuario y contraseña e intenta de nuevo"
      render :new
    end
  end
end
