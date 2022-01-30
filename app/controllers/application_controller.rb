class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :user_type, :username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :user_type, :username, :first_name, :last_name])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def handle_error
    redirect_to page_not_found_path
  end
end
