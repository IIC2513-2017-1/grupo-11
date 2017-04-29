Rails.application.routes.draw do
  resources :comments
  resources :categories
  resources :proyects
  resources :users
  get 'welcome/index'
  root 'welcome#index'

end
