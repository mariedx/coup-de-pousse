Rails.application.routes.draw do
  get 'avatars/create'
  get 'avatar/create'
  root 'gardens#index'
  get '/users/dashboard', to: 'users#dashboard'

  devise_for :users
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :gardens
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
