Rails.application.routes.draw do
  devise_for :users
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/globe', to: 'pages#globe', as: 'globe'
  resources :boats do
    resources :reviews, only: %i[create destroy]
    resources :bookings, only: %i[show create destroy]
  end
  resources :inboxes, only: %i[show]

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
