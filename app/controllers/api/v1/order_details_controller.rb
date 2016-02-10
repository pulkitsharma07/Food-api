class Api::V1::OrderDetailsController < Api::V1::ApplicationController

	before_action :restrict_access
	before_action :curr_order


	def update

		element = @curr_order.order_details.where(id: params[:order_detail_id])[0]
		element.destroy
		
		@curr_order.order_details << OrderDetail.new(order_id: params[:order_id], food_item_id: params[:food_item_id], quantity: params[:quantity])

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