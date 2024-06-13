class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    sign_up_added_attrs = [ :nickname, :email, :password, :avatar ]
    account_update_added_attrs = [ :nickname, :avatar ]
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: account_update_added_attrs
  end
end
