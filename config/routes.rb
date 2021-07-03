Rails.application.routes.draw do
  root to: 'ideas#index'
  # resources :categories, only: [:index, :new, :create]
  resources :ideas do
    collection do
      get 'search'
    end
  end
end
