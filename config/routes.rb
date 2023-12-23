Rails.application.routes.draw do
  devise_for :users
  get 'words/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  # resources :public_rooms, only: [:new, :create]
  # resources :private_rooms, only: [:new, :create]

  resources :rooms, only: [:new, :create, :destroy] do
    resources :words
  end
end
