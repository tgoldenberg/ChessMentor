class ApplicationController < ActionController::Base
  respond_to :html, :js
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :avatar, :remote_avatar, :name, :mentor, :city, :country, :user_ranking, :fee) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :avatar, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :mentor, :city, :country, :user_ranking, :fee ) }
  end
end
