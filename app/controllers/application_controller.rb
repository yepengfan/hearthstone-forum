class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  # redirect user to their user management page after signed in
  def after_sign_in_path_for(users)
    request.env['omniauth.origin'] || stored_location_for(users) || user_management_path(current_user.name)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
