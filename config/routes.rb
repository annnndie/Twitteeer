Rails.application.routes.draw do
  
  # user
  get 'login', to: 'users#login'
  post 'sign_in', to: 'users#sign_in'
  get 'sign_up', to: 'users#sign_up'
  post 'sign_up', to: 'users#registration'
  delete 'logout', to: 'users#logout'
  resource :user, only: [:edit, :update]

  root 'users#login'
end