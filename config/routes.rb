Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "projects#index"

  resources :projects, except: [:destroy] do
    resources :comments, only: [:create]
  end
end
