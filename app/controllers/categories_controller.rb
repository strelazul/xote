class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(:products).find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:id, :name, :description)
  end
end
