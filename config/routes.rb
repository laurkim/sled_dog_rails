Rails.application.routes.draw do
  resources :dogs, :sleds
  get '/dogs', to: 'dogs#create'
end
