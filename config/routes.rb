Rails.application.routes.draw do
  root to: 'fizz_buzzs#index'

  resources :fizz_buzzs, only: :show
  resources :sessions, only: :create
  resources :favorites, only: [:index, :create]
end
