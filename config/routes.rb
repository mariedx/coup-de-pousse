Rails.application.routes.draw do
  get 'static_pages/team'
  get 'static_pages/contact'
  root 'gardens#index'

  devise_for :users
  resources :users 

  resources :gardens do
    resources :comments
    resources :favorites
    resources :appointments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end