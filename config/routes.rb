Rails.application.routes.draw do
  get 'static_pages/team'
  get 'static_pages/contact'
  root 'gardens#index'

  devise_for :users

  resources :gardens do
    resources :comments
    resources :favorites
    resources :appointments
  end

  resources :users do
    resources :chat_rooms, except: [:edit]
  end

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end