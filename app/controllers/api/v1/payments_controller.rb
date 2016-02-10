class Api::V1::PaymentsController < Api::V1::ApplicationController

	before_action :restrict_access,:curr_order

	def received
		@current_order.payment = "received"
		@current_order.save
		render json: @current_order , status: 200
	end

	def refund
		@current_order.payment = "refund_initiated"
		@current_order.save
		render json: @current_order , status: 200
	end
end
