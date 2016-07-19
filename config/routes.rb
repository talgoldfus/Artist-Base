Rails.application.routes.draw do
  resources :carts
  resources :image_collections
  resources :audio_collections
  resources :video_collections
  resources :media
  resources :fans
  resources :artists
  resources :artist_fans


  get '/recommendations' ,to: 'recommendations#index'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  root to: 'home#index'
  post '/carts/add_item' ,to: 'carts#add_item'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
