Rails.application.routes.draw do
  devise_for :users
  root to: 'spots#index'
  resources :reviews, only: [:index, :new, :create, :show]
  # resources :spots,
end
