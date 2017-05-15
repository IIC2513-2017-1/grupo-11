Rails.application.routes.draw do
  resources :users, :categories, :likes
  resources :session, only: [:new, :create, :destroy]
  resources :proyects do
    resources :comments
    resources :likes
  end
  get 'welcome/index'
  root 'welcome#index'

end
