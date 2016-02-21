class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    path_for_current_user || root_path
  end

  before_action do
    if defined?(Rack::MiniProfiler) && params[:rmp] && user_signed_in? && current_user.admin?
      Rack::MiniProfiler.authorize_request
    end
  end

  private

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def path_for_current_user
    case
    when current_user.nil?
      nil
    end
  end

  def time_zone_from_request
    return '' if request.location.blank?
    request.location.data['time_zone']
  end

  def current_user
    @current_user = super || NullUser.new
  end

  def configure_permitted_parameters
    permitted_params = [:email, :password, :password_confirmation, :first_name, :last_name]
    devise_parameter_sanitizer.for(:sign_up) << permitted_params
    devise_parameter_sanitizer.for(:account_update) << permitted_params
  end
end
