class LoginController < ApplicationController
  def index
    @user = User.new
  end

  private
  def use_auth_action?
    false
  end
end
