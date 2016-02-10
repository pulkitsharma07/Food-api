class Api::V1::UsersController < Api::V1::ApplicationController

	before_action :restrict_access, except: [:create]

	def create
		@current_user = params[:username] ? User.create(name: params[:username]) : nil

		if @current_user
			render json: @current_user, status: 200
		else
			render json: {"status" => "failure"}, status: 400
		end

	end


	def orders
		od = @current_user.orders.all
		render json: od , status: 200, root: "orders"
	end

	
end