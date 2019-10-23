class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_deluser
  before_action :authenticate_deluser!

  def after_sign_in_path_for(resource)
    case resource
    when User
      user_path(current_user)
    when Admin
      admins_path
    end
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end

  
  private
  def current_deluser
    @current_user ||= current_user.try(:user)
  end

  def authenticate_deluser!
    return unless user_signed_in? && @current_user.is_deleted?
    sign_out
    flash[:alert] = "Your team account has already been deleted."
    redirect_to new_user_session_path
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:user_name,:sex,:prefecture_id])
  end
end
