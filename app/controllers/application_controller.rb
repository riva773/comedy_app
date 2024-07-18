class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    authenticated_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    unauthenticated_root_path
  end


  protected

  def configure_permitted_parameters
    sign_up_added_attrs = [ :nickname, :email, :password, :avatar ]
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_added_attrs
  end
end
