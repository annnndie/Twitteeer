Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: [:edit, :update, :new]

  root 'tweets#index'
end
