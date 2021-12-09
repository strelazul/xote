class ApplicationController < ActionController::Base
  before_action :set_categories_for_menu

  private

  def set_categories_for_menu
    @categories = Category.all
  end
end
