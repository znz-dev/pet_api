Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(index create show update destroy)
  resources :pets, only: %i(index create show update destroy)
  resources :pet_applications
end
