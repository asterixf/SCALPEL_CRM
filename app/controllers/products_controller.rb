class ProductsController < ApplicationController

  def index
    @products = Product.all
    @product = Product.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product created succesfully"
    else
      flash[:alert] = @product.erros.full_messages.join
    end
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo)
  end

end
