Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bikes#index"
  resources :users, only: [:index, :show]
  resources :bikes, only: [:index, :show]
  resources :subscriptions, only: [:index, :show, :new, :create, :destroy]
end
