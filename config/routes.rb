Rails.application.routes.draw do
  resources :movies, only: [:index, :create, :show, :update, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
