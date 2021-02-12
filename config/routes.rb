Rails.application.routes.draw do
  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :artists, only: [:index, :new, :create, :show]
end
