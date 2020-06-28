Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :tweets, except: [:edit, :update, :new]
  resources :relationships, only: [:index]
  resources :users, only: [] do
    member do
      patch :follow
      delete :unfollow
    end
  end

  root 'tweets#index'
end
