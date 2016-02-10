class Api::V1::FoodItemsController < Api::V1::ApplicationController

	def index
		render json: FoodItem.all, status: 200
	end
	
	def create
		
		begin
			item = FoodItem.create(name: params[:name], price: params[:price], quantity_left: params[:quantity])
			render json: item ,status: 200
		rescue
			render json: {"status" => "failure"}, status: 400
		end
		
	end
end