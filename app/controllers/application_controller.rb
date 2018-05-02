class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters

    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,:email,:encrypted_password,:classes_id,:birth_date) }
    #update_attrs = [:name,:email,:encrypted_password,:classes_id,:birth_date]
    #devise_parameter_sanitizer.permit :sign_up, keys: update_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:encrypted_password,:classes_id,:birth_date])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:email,:birth_date, :password_confirmation])
    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :encrypted_password, :current_password, :date_of_birth) }
  end

end
