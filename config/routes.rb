Rails.application.routes.draw do
  resources :users, :categories, :likes, :donations
  resources :session, only: [:new, :create, :destroy]

  resources :user do
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

end
