class UsersController < ApplicationController
	
	before_action :get_user, only: [:destroy]

	def get_user
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			render "registrations/index"
		end
	end

	def user_params
		params.require(:user).permit(:username, :firstname, 
			:lastname, :password, :password_confirmation, :email,
			:role_id, :created_at, :updated_at)
	end

	def index
		@users = []
		allUsers = User.all
		if cookies[:role] == 'Site Administrator'
			@users = allUsers.where(role_id: [4])
		elsif cookies[:role] == 'Vendor Administrator'
			@users = allUsers.where(role_id: [4])
		end
	end

	def destroy
		@user.destroy
		redirect_to :back	
	end

end
