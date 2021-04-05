Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :followings, :followers
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
