class ApplicationController < ActionController::Base
  # Deviseのコントローラーが呼ばれる前に、configure_permitted_parametersメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  
  def configure_permitted_parameters
  
    # sign_up（新規登録）の際に、以下のパラメータの入力を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nick_name, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :birth_date
    ])
    
    # 必要であれば、account_update（情報更新）の際にも同様に許可します
    # devise_parameter_sanitizer.permit(:account_update, keys: [ ... ])
  end
end
 private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
         username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

