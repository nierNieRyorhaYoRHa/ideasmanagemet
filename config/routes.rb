Rails.application.routes.draw do
  root to: 'ideas#index'
  resources :categories, only: [:index, :new, :create]
  resources :ideas, only: [:index, :new, :create]
end
