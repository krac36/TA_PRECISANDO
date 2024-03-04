Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :products do
    member do
      get :blocked_dates
    end
    resources :rentals, only: %i[create]
  end

  resources :rentals, only: [:update, :destroy]

  get "/profile", to: "users#profile", as: :profile
end
