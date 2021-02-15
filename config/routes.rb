Rails.application.routes.draw do
  root 'tops/index'
  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :fans, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :artists, only: [:index, :new, :create, :show], shallow: true do
    resources :channels, only: [:new, :create, :show] do
      resources :comments
    end
  end
end
