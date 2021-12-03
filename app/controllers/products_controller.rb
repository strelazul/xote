class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all
  end

  def show
    @product = Product.find(params[:id])
  end

  private def article_params
    params.require(:product).permit(:id, :category_id)
  end
end
