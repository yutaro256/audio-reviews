Rails.application.routes.draw do
  root to: 'toppages#top'
  
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
