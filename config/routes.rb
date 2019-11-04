Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'toppages#top'
  
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :items do
    member do
      get :new_review
    end
  end
  resources :likes, only: [:create, :destroy]
  resources :reviews, only: [:index, :create, :edit, :update, :show, :destroy]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
