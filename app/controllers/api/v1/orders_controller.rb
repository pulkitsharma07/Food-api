class Api::V1::OrdersController < Api::V1::ApplicationController

	before_action :restrict_access
	before_action :get_current_order, except: [:create]

	def create

		begin
			str = params[:items].to_json
			arr = JSON.parse(str)

			@current_order = Order.create

			arr.each do |item|
				odt = OrderDetail.create(order_id: @current_order.id, food_item_id: item["food_item_id"],quantity: item["quantity"])
				
				if !odt.errors.empty?
					raise "Insufficient Items"
				end
			end

			@current_user.orders << @current_order

			show()
		rescue
			render json: {"status" => "failure"}, status: 400
		end
	end
	
	
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
		if @current_order
			render json: @current_order
		else
			render json: {"status" => "failure"}, status: 400
		end
	end
end