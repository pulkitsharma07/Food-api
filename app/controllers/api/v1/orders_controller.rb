class Api::V1::OrdersController < Api::V1::ApplicationController

	before_action :restrict_access

	def create

		#begin
			str = params[:items].to_json
			arr = JSON.parse(str)

			p "ssssssssssssssssssssssssssssssss",arr

			od = Order.create

			arr.each do |item|
				OrderDetail.create(order_id: od.id, food_item_id: item["food_item"],quantity: item["quantity"])
			end

			@current_user.orders << od


			show(od.id)
		
	end



	def show(id=nil)

		xx = Order.find_by(id: id||params[:id], user_id: @current_user.id)
		render json: xx
	end
end