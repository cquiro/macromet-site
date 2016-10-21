class TeammatesController < ApplicationController
  before_action :set_teammate, only: [:show, :edit]

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
  end

  def update
  end

  def destroy
  end

  private

    def set_teammate
      @teammate = Teammate.find(params[:id])
    end
end
