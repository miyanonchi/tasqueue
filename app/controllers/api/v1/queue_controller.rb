class Api::V1::QueueController < Api::V1::ApiController
  def index
    @queue = TaskQueue.where(:user_id => session[:user_id])

    res = make_response({:queue => @queue})

    render :json => res
  end
end
