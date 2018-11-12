Rails.application.routes.draw do
  devise_for :users

  resources :boats do
    resources :reviews, only: %i[create destroy]
    resources :bookings, only: %i[index create destroy]
  end
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
