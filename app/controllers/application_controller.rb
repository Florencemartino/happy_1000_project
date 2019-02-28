class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :photo])
  end
end
