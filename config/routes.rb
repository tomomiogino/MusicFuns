Rails.application.routes.draw do
  root 'artists#index'
  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :fans, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :artists, only: [:index, :new, :create, :show] do
    resources :channels
  end
end
