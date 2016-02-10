class Api::V1::OrdersController < Api::V1::ApplicationController

	before_action :restrict_access
	before_action :get_current_order, except: [:create]

	def create

			str = params[:items].to_json
			arr = JSON.parse(str)

			@current_order = Order.create

			arr.each do |item|
				OrderDetail.create(order_id: @current_order.id, food_item_id: item["food_item"],quantity: item["quantity"])
			end

			@current_user.orders << @current_order

			show()
		
	end


	def delivered
		@current_order.delivered = true
		@current_order.save
		show()
	end

	def show()
		render json: @current_order
	end
end