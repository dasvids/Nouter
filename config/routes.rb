Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'notes#index'

  get '/auth', to: 'auth#new'
  post '/auth', to: 'auth#create'
  delete '/auth', to: 'auth#destroy'

  get '/users', to: 'users#new'
  post '/users', to: 'users#create'

  #get '/feed', to: 'notes#index'

  resources :notes
end
