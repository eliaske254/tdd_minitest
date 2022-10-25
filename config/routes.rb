Rails.application.routes.draw do
  devise_for :users
  resources :ratings
  resources :people
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "people#index"
end