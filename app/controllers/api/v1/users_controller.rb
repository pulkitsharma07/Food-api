class Api::V1::UsersController < Api::V1::ApplicationController

	before_action :restrict_access, except: [:create]

	def create
		@current_user = params[:username] ? User.create(name: params[:username]) : nil

		render json: @current_user, status: (@current_user)? 200 : 401
	end


	def chk
		render json: @current_user, status: 200
	end
end