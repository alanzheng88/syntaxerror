class UsersController < ApplicationController
	
	before_action :get_user, only: [:destroy]

	def get_user
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:registration_status] = "You signed up successfully"
			redirect_to root_path
		else
			flash[:registration_status] = "Form is invalid"
			render :new
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
		if session[:role] == 'Site Administrator' || session[:role] == 'Vendor Administrator'
			@users = allUsers.where(role_id: [4])
		end
	end

	def destroy
		@user.destroy
		redirect_to :back	
	end

end
