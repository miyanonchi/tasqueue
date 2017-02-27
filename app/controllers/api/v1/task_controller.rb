class Api::V1::TaskController < Api::V1::ApiController
  def index
    @task = Task.where(:user_id => session[:user_id])

    res = make_response({:task => @task})

    render :json => res
  end
end
