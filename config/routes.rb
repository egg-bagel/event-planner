Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root to: "events#index"

  resources :events
  resources :signups

  get "/users/show/:id", to: "users#show", as: "show_user"
end