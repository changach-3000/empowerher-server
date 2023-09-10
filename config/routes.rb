Rails.application.routes.draw do
  resources :users

  delete "/auth/logout", to:"session#logout"
  get "/current_user", to:"users#current_user"
  post '/auth/login', to: 'session#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
