class AdminsController < ApplicationController
    before_action :configure_permitted_parameters, if: :devise_controller?
  
  def 
    
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
