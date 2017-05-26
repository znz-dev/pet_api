Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(index create show update destroy) do
    get :messages
    get :collections
  end
  resources :pets, only: %i(index create show update destroy) do
    get :ablum
    get :comments
  end
  resources :pet_applications
  resources :albums
  resources :photos
  resources :messages, only: %i(create show destroy)
  resources :comments, only: %i(create destroy)
  resources :topics, only: %i(index create show update destroy)
  resources :posts, only: %i(index create show destroy) do
    resources :post_replies, only: %i(create destroy)
  end
  resources :collections, only: %i(create destroy)
  resources :adoption_applies, only: %i(create update index)

  post '/login', to: 'users#login'
end
