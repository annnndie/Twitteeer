Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: [:edit, :update, :new]
  resources :relationships, only: [:index, :create, :destroy]

  root 'tweets#index'
end
