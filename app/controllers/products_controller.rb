class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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

  def update
    if @product.update(product_params) 
      flash[:success] = "El producto ha sido modificado"
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path,
      notice: "Se ha eliminado un producto del portafolio"
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :client, :product_line, :photo)
    end
end
