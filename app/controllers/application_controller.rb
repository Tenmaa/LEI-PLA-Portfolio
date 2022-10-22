class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_games_index_path(resource)
  end
  
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :profile_image])
  end
end
