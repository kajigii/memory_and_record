Rails.application.routes.draw do
  devise_for :users
  
  get 'words/index'
  root to: "words#index"
end
