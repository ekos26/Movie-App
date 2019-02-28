Rails.application.routes.draw do

  resources :directors
  resources :movies

  get '/gaga', to: 'movies#gaga_method', as: 'gaga'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
