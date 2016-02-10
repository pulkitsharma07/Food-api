class Api::V1::OrderDetailsController < Api::V1::ApplicationController

	before_action :restrict_access
	before_action :get_current_order


	def update

		element = @current_order.order_details.where(id: params[:order_detail_id])[0]
		element.destroy
		
		@current_order.order_details << OrderDetail.new(order_id: params[:order_id], food_item_id: params[:food_item_id], quantity: params[:quantity])

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