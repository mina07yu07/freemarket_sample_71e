class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?

  # CSRF対策
  protect_from_forgery with: :exception

  
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  def production?
    Rails.env.production?
  end

  # Basic認証の定義
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
 
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name,:family_name, :first_name_kana, :family_name_kana, :birth_year, :birth_month, :birth_day, :post_code, :prefecture_code, :city, :house_number, :building_name, :phone_number,:destination_first_name,:destination_family_name, :destination_first_name_kana, :destination_family_name_kana])
  end

end
