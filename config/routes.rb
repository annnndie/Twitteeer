Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: [:edit, :update, :new]
  resources :relationship, only: [:index, :create, :destroy]

  root 'tweets#index'
end
