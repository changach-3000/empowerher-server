Rails.application.routes.draw do

  scope "/api" do
    resources :users, only: [:index, :show, :create]
  end

 
  delete "/api/auth/logout", to:"session#logout"
  get "/api/current_user", to:"users#current_user"
  post '/api/auth/login', to: 'session#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
