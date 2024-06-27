class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :likes).order(created_at: :desc)
  end

  protected

  def configure_permitted_parameters
    sign_up_added_attrs = [ :nickname, :email, :password, :avatar ]
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_added_attrs
  end


end
