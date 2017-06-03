class HomeController < ApplicationController
  def index
    @queue = TaskQueue.where(:user_id => session[:user_id]).order(:priority => :asc)
  end
end
