Rails.application.routes.draw do
  root to: 'toppages#top'
  
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
end
