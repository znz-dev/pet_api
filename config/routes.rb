Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(index create show update destroy) do
    get :messages
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

  post '/login', to: 'users#login'
end
