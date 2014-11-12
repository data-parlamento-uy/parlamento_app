Rails.application.routes.draw do
  root 'home#index'

  resources :legislators, only: [:index]

end
