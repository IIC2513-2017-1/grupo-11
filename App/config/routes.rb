Rails.application.routes.draw do
  resources :users
  resources :proyects
  resources :comments
  resources :categories
  get 'welcome/index'
  root 'welcome#index'
  
end
