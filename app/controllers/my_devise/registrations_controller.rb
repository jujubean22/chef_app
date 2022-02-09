class MyDevise::RegistrationsController < Devise::RegistrationsController
  protected 

  def after_update_path_for(resource)
    flash[:notice] = "Account succesfully updated"
    if resource.user_type == 'Chef'
      chef_profile_path(resource.chef.id)
    elsif resource.user_type == 'Client'
      client_profile_path(resource.client.id)
    end
  end
end