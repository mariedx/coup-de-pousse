Rails.application.routes.draw do
  root 'gardens#index'

  devise_for :users
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :gardens do
    resources :favorites
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
