class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Se ha agregado un nuevo producto al portafolio"
      redirect_to @product
    else
      render :new
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :client, :product_line, :photo)
    end
end
