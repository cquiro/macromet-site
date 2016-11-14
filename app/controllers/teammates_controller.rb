class TeammatesController < ApplicationController
  before_action :set_teammate, only: [:show, :edit, :update, :destroy]

  def index
    @teammates = Teammate.all
  end

  def show
  end

  def new
    @teammate = Teammate.new
  end

  def edit
  end

  def create
    @teammate = Teammate.new(teammate_params)

    if @teammate.save
      flash[:success] = "Un nuevo integrante ha sido incorporado al equipo"
      redirect_to @teammate
   else
     render :new
    end
  end

  def update
    if @teammate.update(teammate_params)
      flash[:success] = "El integrante del equipo ha sido modificado"
      redirect_to @teammate
    else
      render :edit
    end
  end

  def destroy
    @teammate.destroy
    redirect_to teammates_url, 
      notice: "Un integrante del equipo ha sido eliminado."
  end

  private

    def set_teammate
      @teammate = Teammate.find(params[:id])
    end

    def teammate_params
      params.require(:teammate).permit(:name, :position, :bio, :photo)
    end
end
