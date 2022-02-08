class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :update_resource, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.user_type == 'Admin'
      admin_root_path
    elsif resource.user_type == 'Client'
      client_root_path
      # client_profile_path(resource.client.id)
    elsif resource.user_type == 'Chef'
      chef_root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :user_type, :username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :user_type, :username, :first_name, :last_name])
  end

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def handle_error
    redirect_to page_not_found_path
  end
end
