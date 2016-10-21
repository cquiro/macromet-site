class TeammatesController < ApplicationController
  before_action :set_teammate, only: [:show]

  def index
  end

  def show
  end

  def new
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
