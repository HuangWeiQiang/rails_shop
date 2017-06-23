Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories do
	  resources :items
    member do
      # resources :items
    end
  end
  get '/carts', to: 'shopping_carts#show'
  post '/carts', to: 'shopping_carts#create'
  delete '/carts', to: 'shopping_carts#clean'
  delete '/carts/:id', to: 'shopping_carts#destroy', as: :cart_delete
	root 'home#home_page'
end
