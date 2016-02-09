class Api::V1::FoodItemsController < Api::V1::ApplicationController

	def index
		render json: FoodItem.all, status: 200
	end
end