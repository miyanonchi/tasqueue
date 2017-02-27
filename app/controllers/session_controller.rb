class SessionController < ApplicationController
  def create
    user = User.find_by(user_params)

    if user.present?
      session[:user_id] = user.id
      session[:account] = user.account

      logger.info session

      redirect_to :home, :notice => "Login OK!!"
    else
      redirect_to :login, :alert => "Login NG!!"
    end
  end

  def destroy
    session.clear
    redirect_to :root
  end

  def user_params
    params.require(:user).permit(:account, :password)
  end

  private
  def use_auth_action?
    false
  end
end
