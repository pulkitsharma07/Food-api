class Api::V1::FoodItemsController < Api::V1::ApplicationController

	def index
		if(params[:food_item_id])
			begin
				render json: FoodItem.find_by_id(params[:food_item_id])			
			rescue
				render json: {"status" => "failure"} , status: 400
			end
		else
			render json: FoodItem.all, status: 200
		end
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