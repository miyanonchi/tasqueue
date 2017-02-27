class WelcomeController < ApplicationController
  def index
  end

  private
  def use_auth_action?
    false
  end
end
