class Api::V1::UsersController < Api::V1::ApplicationController

	before_action :restrict_access, except: [:create]

	def create
		@current_user = params[:username] ? User.create(name: params[:username]) : nil

		render json: @current_user, status: (@current_user)? 200 : 401
	end

	def orders
		od = @current_user.orders.all
		render json: od , status: 200, root: "orders"
	end

	
end