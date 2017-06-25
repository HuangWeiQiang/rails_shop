class OrderItem < ApplicationRecord
	belongs_to :order_form
	belongs_to :item
end
