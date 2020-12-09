Rails.application.routes.draw do
  root 'gardens#index'

  devise_for :users

  resources :gardens do
    resources :comments
    resources :favorites
    resources :appointments
  end

  resources :users do
    resources :chat_rooms, only: [:new, :create, :show, :index]
  end

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end