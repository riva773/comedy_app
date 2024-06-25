class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    sign_up_added_attrs = [ :nickname, :email, :password, :avatar ]
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_added_attrs
  end
end
