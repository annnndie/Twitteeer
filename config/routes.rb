Rails.application.routes.draw do
  
  # user
  get 'sign_up', to: 'users#sign_up'
  post 'sign_up', to: 'users#registration'
  get 'login', to: 'users#login'
  post 'sign_in', to: 'users#sign_in'
  delete 'logout', to: 'users#logout'
  resource :user, only: [:edit, :update]

  root 'users#registration'
end