class StaticPagesController < ApplicationController
  before_action :require_user, only: [:contenido]
  def contacto
  end

  def contenido
  end
end
