Rails.application.routes.draw do
  devise_for :users
  get 'words/index'
  root to: "words#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end
