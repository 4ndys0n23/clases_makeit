class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.json { render json: { products: @products }, status: :ok }
    end
  end

  def alert_js; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    respond_to do |format|
      format.html { redirect_to products_path }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.update(params[:id], product_params)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
