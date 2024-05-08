Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Defines the root path route ("/")
  # root "posts#index"

  # methods originals for resources: products
  # get "up" => "rails/health#show", as: :rails_health_check
  # get "/products", to: 'products#index'
  # get "/products/integer:id", to: 'products#show', as: :product
  # get "/products/new", to: 'products#new', as: :new_product  
  # get "/products/:id/edit", to: 'products#edit', as: :edit_product
  # post "/products", to: 'products#create'
  # patch "/products/integer:id", to: 'products#update'
  # delete "/products/integer:id", to: 'products#destroy'
  
  resources :products, path: '/'
end
