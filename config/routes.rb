Rails.application.routes.draw do
  resources :users, :proyects, :comments, :categories
  resources :session, only: [:new, :create, :destroy]
  get 'welcome/index'
  root 'welcome#index'
  
end
