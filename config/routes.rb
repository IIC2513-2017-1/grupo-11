Rails.application.routes.draw do
  resources :users, :categories, :likes, :donations
  resources :session, only: [:new, :create, :destroy]
  resources :proyects do
    resources :comments
  end
  get 'welcome/index'
  root 'welcome#index'

end
