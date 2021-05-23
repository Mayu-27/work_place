Rails.application.routes.draw do
  devise_for :users
  root to: 'spots#index'
  resources :users, only: [:show] 
  resources :spots do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  post '/spots/:spot_id/reviews/:id/edit', to: 'reviews#update'
  delete '/spots/:spot_id/reviews/:id', to: 'reviews#destroy'
  get 'search', to: 'spots#search'
end


