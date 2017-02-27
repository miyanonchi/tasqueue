class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user, if: :use_auth_action?

  private
  def use_auth_action?
    true
  end

  def authenticate_user
    redirect_to :root, :alert => "ログインされていません" if session[:user_id].nil?
  end
end
