class UsersController < ApplicationController
	
	before_action :get_user, only: [:destroy]

	def get_user
		@user = User.find(params[:id])
	end

	def create
		User.create(username: params[:username],
			firstname: params[:firstname],
			lastname: params[:lastname],
			password: params[:secret],
			email: params[:email],
			role_id: 4)
		redirect_to root_path
	end

	def index
		@users = []
		allUsers = User.all
		if cookies[:role] == 'Site Administrator'
			@users = allUsers.where(role_id: [2,3,4])
		elsif cookies[:role] == 'Vendor Administrator'
			@users = allUsers.where(role_id: [3,4])
		end
	end

	def destroy
		@user.destroy
		redirect_to :back	
	end	
end
