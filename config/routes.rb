Rails.application.routes.draw do
  root 'gardens#index'
  get '/users/dashboard', to: 'users#dashboard'

  devise_for :users
  resources :users
  resources :gardens
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
