Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'toppages#top'
  
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :items
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
