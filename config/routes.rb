Rails.application.routes.draw do
  devise_for :users
  root to: 'spots#index'
  resources :users, only: [:show] 
  resources :spots do
    resource :favorites, only: [:create, :destroy]
    resources :reviews, only: [:index, :new, :create]
    # post 'review' => 'reviews#create'
  end
end


