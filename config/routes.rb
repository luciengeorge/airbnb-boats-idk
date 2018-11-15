Rails.application.routes.draw do
  devise_for :users
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :boats do
    resources :reviews, only: %i[create destroy]
    resources :bookings, only: %i[show create destroy]
  end
  resources :conversations do
    resources :messages
  end
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
