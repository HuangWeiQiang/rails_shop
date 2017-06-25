class OrderFormsController < ApplicationController
	@@已创建 = 1
	@@已接单 = 2
	@@已完成 = 3
	def new
		@order = OrderForm.new
	end

	def create
		@order_form = OrderForm.create!
		@cart = session[:cart]
		order_form_total = 0
		@cart.each do |item_id, info|
			order_item = OrderItem.create!(item_id: item_id,
			                              item_count: info['count'],
			                              order_form_id: @order_form.id)
			order_form_total += (order_item.item.price * order_item.item_count)
		end
		@order_form.state = @@已创建
		@order_form.total = order_form_total
		@order_form.save!
		session[:recent_order] ||= []
		session[:recent_order] << @order_form.id
		redirect_to @order_form
	end

	def show
		@order_form = OrderForm.find(params[:id])
	end

	def destroy
		@order_form = OrderForm.find(params[:id])
		@order_form.destroy
		redirect_to order_forms_path
	end

	def index
		@order_forms = OrderForm.all
	end

	def recent
		session[:recent_order] ||= []
		@order_forms = []
		recent_order_id = session[:recent_order]
		recent_order_id.each do |order_id|
			order_form = OrderForm.find_by(id: order_id)
			@order_forms << order_form if order_form
		end
	end

	private

end
