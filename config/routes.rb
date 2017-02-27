Rails.application.routes.draw do
  root to: "welcome#index"

  # login
  get    "login",    to: "login#index"
  post   "login",    to: "session#create"
  # logout
  delete "logout",   to: "session#destroy" if Rails.env == "production"
  get    "logout",   to: "session#destroy" if Rails.env == "development"

  # home
  get "home", to: "home#index"

  # APIs
  namespace :api do
    get :ping, :to => "api#ping"
    namespace :v1 do
      # queue
      resources :queue
      # task
      resources :task
    end
  end
end
