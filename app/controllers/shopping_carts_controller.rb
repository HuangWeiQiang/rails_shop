class ShoppingCartsController < ApplicationController
	def create
		session[:cart] ||= {}
		@cart = session[:cart]
		item = Item.find(params[:id])
		carts_key = item.id.to_s
		if @cart.key? carts_key
			@cart[carts_key]['count'] += 1
		else
			@cart[carts_key] ||= {}
			@cart[carts_key]['count'] = 1
			@cart[carts_key]['item'] = item
		end
	end

	def destroy
		@cart = session[:cart]
		@cart.delete(params[:id].to_s)
		redirect_to carts_path
	end

	def clean
		session[:cart] = {}
		redirect_to carts_path
	end

	def show
		session[:cart] ||= {}
		@carts = session[:cart]
	end

	def account

	end
end
