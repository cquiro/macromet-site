class BannersController < ApplicationController

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    
    if @banner.update_attributes(banner_params)
      redirect_to contenido_path, notice: "El #{@banner.name} ha sido actualizado."
    else
      flash[:error] = "El banner no se pudo actualizar. Intente de nuevo."
      render action: :edit
    end
  end

  private
    def banner_params
      params.require(:banner).permit(:title, :subtitle, :button, :image, :link)
    end
end
