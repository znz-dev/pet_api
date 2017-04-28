Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(index create show update destroy)
  resources :pets, only: %i(index create show update destroy) do
    get :ablum
  end
  resources :pet_applications
  resources :albums
  resources :photos

  post '/login', to: 'users#login'
end
