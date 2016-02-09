class Api::V1::OrdersController < Api::V1::ApplicationController

	before_action :restrict_access
	before_action :curr_order, except: [:create]

	def create

			str = params[:items].to_json
			arr = JSON.parse(str)

			@curr_order = Order.create

			arr.each do |item|
				OrderDetail.create(order_id: @curr_order.id, food_item_id: item["food_item"],quantity: item["quantity"])
			end

			@current_user.orders << @curr_order

			show()
		
	end


	def delivered
		@curr_order.delivered = true
		@curr_order.save
		show()
	end

	def show()
		render json: @curr_order
	end


	private

	def curr_order
		@curr_order ||= Order.find_by(id: params[:order_id], user_id: @current_user.id)
	end
end