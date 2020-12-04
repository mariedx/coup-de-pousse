Rails.application.routes.draw do
  root 'gardens#index'

  devise_for :users
  resources :users do
    resources :avatars, only: [:create]
  end

  resources :gardens do
    resources :appointments, only: [:new, :create]
  end

  resources :appointments, except: [:new]

end
