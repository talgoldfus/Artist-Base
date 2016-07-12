Rails.application.routes.draw do
  resources :carts
  resources :image_collections
  resources :audio_collections
  resources :video_collections
  resources :media
  resources :fans
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
