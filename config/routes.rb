Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :twitter_users
  # Defines the root path route ("/")
  root "twitter_users#index"
end
