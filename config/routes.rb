Rails.application.routes.draw do
  resources :categories, :likes
  resources :users, only: [:new, :create, :destroy, :show, :edit]
  resources :session, only: [:new, :create, :destroy]
  resources :donations, only: [:create, :destroy]

  resources :user do
    resources :proyects
  end

  resources :categories do
    resources :proyects
  end

  resources :proyects do
    collection do
      get 'search'
    end
    resources :comments
  end
  get 'welcome/index'
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :proyects, only: [:index, :create, :show]
      resources :users, only: [:show]
    end
  end
end
