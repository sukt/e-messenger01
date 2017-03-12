class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
#deviseコントローラ実行時に以下のメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  #新規作成の際、以下の３つのパラメータを含める必要がある
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :thmubnail, :agreement])
  end

end
