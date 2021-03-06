class ApplicationController < ActionController::Base



  def after_sign_in_path_for(resource)
    user_url(resource)
  end
  def after_sign_out_path_for(resource)
  	root_path
  end
  def after_sign_up_path_for(resource)
    user_url(resource)
  end

      protect_from_forgery with: :exception
	  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end

end