Rails.application.routes.draw do
  resources :carts
  resources :image_collections
  resources :audio_collections
  resources :video_collections
  resources :media
  resources :fans
  resources :artists


  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  root to: 'sessions#new'
  post '/carts/add_item' ,to: 'carts#add_item' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
