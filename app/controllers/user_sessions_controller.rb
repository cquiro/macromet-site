class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.authenticate(params[:password])
    session[:user_id] = user.id 
    flash[:success] = "Has iniciado sesión"
    redirect_to contenido_path
  end
end
