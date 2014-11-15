Rails.application.routes.draw do
  root 'home#index'

  resources :legislators, only: [:index] do
    collection do
      get 'diputados'
      get 'senadores'
      get 'search'
    end
  end

  resources :comissions, only: [:index, :show] do
    collection do
      get 'diputados'
      get 'senadores'
    end
  end

  resources :sessions, only: [:index]
end

