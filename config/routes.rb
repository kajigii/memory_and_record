Rails.application.routes.draw do
  devise_for :users
  get 'words/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :words, only: [:index, :create]
  end
end
