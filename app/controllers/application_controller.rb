class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories_for_menu

  def after_sign_in_path_for(resource)
    unless session[:return_to].nil?
      session[:return_to]
      session.delete[:return_to]
    end
  end

  private

  def set_categories_for_menu
    @categories = Category.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name email password
                                               password_confirmation])
  end
end
