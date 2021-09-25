# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_inactive_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /customers/sign_in
  def new
    # super
  end

  # POST /resource/sign_in
  def create
    # super
  end

  # DELETE /resource/sign_out
  def destroy
    # super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # 新規登録後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    top_path
  end


  def reject_inactive_user
    @customer = Customer.find(params[:id])
    if @user
      if @customer.valid_password?(params[:id]) && !@customer.is_valid
        redirect_to new_user_session_path
      end
    end
  end

end
