class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :daily_goal, :avatar, :metric])
    devise_parameter_sanitizer.permit(:account_update, keys: [:emaill, :password, :daily_goal, :avatar, :metric])
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
