Rails.application.routes.draw do
  devise_for :users
  root to: 'spots#index'
  resources :users, only: [:show] 
  resources :spots do
    resources :reviews
    resource :favorites, only: [:create, :destroy]
  end
  get 'search', to: 'spots#search'
end


