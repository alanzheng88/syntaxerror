class UsersController < ApplicationController

	def create
		User.create(username: params[:username],
			firstname: params[:firstname],
			lastname: params[:lastname],
			password: params[:secret],
			email: params[:email],
			rolekey: 4)
		redirect_to root_path
	end

	def index
		@users = User.all
	end
end
