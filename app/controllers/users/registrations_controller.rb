# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters


  protected

  def after_sign_up_path_for(resource)
    ogiri_topics_path
  end

  def configure_permitted_parameters
    account_added_attrs = [ :nickname, :avatar, :profile ]
    devise_parameter_sanitizer.permit :account_update, keys: account_added_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: account_added_attrs)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end


  def after_update_path_for(resource)
    user_path(resource)
  end
end
