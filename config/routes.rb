Rails.application.routes.draw do

  root to: 'events#index'
  resources :cities
  resources :countries
  resources :venues
  resources :events

end
