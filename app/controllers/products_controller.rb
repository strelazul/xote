class ProductsController < ApplicationController
  def index
    @products = if params[:search] || params[:category_id]
                  Product.search_products(params[:search], params[:category_id])
                else
                  Product.includes(:category).all
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :description, :on_sale, :search, :category_id)
  end
end
