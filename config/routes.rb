Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

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

  get '/search', to: 'searches#search'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
