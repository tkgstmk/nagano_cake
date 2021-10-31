class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      top_path
    when Customer
      mypage_path
    end
  end
end
