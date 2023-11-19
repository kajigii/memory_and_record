Rails.application.routes.draw do
  devise_for :users
  get 'words/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :words
  end
end
