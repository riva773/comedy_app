# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters


  protected

  def configure_permitted_parameters
    account_added_attrs = [ :nickname, :avatar, :profile ]
    devise_parameter_sanitizer.permit :account_update, keys: account_added_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: account_added_attrs)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
