Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rides, only: %i(index show new create)

  mount RailsEventStore::Browser => '/res'
end
