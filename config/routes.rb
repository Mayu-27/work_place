Rails.application.routes.draw do
  devise_for :users
  root to: 'spots#index'
  resources :users, only: [:show] 
  resources :spots do
    resources :reviews, only: [:index, :new, :create]
    resource :favorites, only: [:create, :destroy]
  end
  resources :reviews, only: [:edit, :update, :destroy]
end


