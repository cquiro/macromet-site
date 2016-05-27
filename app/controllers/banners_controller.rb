class BannersController < ApplicationController

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    
    if @banner.update_attributes(banner_params)
      flash[:notice] = "El #{@banner.name} ha sido actualizado."
      # redirect_to contacto_path, notice: "Gracias por contactarnos. Pronto nos comunicaremos con usted."
      render action: :edit#, notice: "El #{@banner.name} ha sido actualizado."
    else
      flash[:error] = "El banner no se pudo actualizar. Intente de nuevo."
      render action: :edit
    end
  end

  private
    def banner_params
      params.require(:banner).permit(:title, :subtitle, :button, :image)
    end
end
