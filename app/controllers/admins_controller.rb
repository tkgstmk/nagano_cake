class AdminsController < ApplicationController
    before_action :configure_permitted_parameters, if: :devise_controller?
  
 
    
  
  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end
  
  def list
    @customers = customer.all
    
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
