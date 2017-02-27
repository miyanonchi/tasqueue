class Api::ApiController < ApplicationController
  layout false

  # 定数
  API_VERSION = 0

  def ping
    render :json => make_response({:message => "pong"})
  end

  private
  # API用のauthenticate_userにオーバーライド
  def authenticate_user
    obj = make_response({:message => "Unauthorized"}, 401)

    if session[:user_id].nil?
      render :json => obj, :status => 401
    end
  end

  def make_response(obj = {}, status = 200)
    {
      :version => self.class::API_VERSION,
      :status => status,
    }.merge(obj)
  end
end
