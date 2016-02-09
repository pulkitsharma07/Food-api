class Api::V1::OrdersController < Api::V1::ApplicationController

	before_action :restrict_access

	def create
		str = params[:items].to_json
		arr = JSON.parse(str)

		od = Order.create

		arr.each do |item|
			OrderDetail.create(order_id: od.id, food_item_id: item["food_item"],quantity: item["quantity"])
		end

		@current_user.orders << od

		render json: arr, status: 200
	end
end