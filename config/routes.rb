require "karafka/web"

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :customers

  # Defines the root path route ("/")
  root "customers#index"

  # https://karafka.io/docs/Web-UI-Getting-Started/
  mount Karafka::Web::App, at: "/karafka"
end
