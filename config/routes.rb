Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories do
	  resources :items
  end

  resources :order_forms, id: /\d+/

  get '/order_forms/recent', to: 'order_forms#recent'
  get '/carts', to: 'shopping_carts#show'
  get '/carts/pre_order', to: 'shopping_carts#pre_order'
  post '/carts', to: 'shopping_carts#create'
  delete '/carts', to: 'shopping_carts#clean'
  delete '/carts/:id', to: 'shopping_carts#destroy', as: :cart_delete
	root 'home#home_page'
end
