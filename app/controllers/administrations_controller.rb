class AdministrationsController < ApplicationController

	def index
		@_role_id = []
		if session[:role] == 'Site Administrator'
			@_role_id = [2,3]
		elsif session[:role] == 'Vendor Administrator'
			@_role_id = [3]
		end
		@user_list = User.where(role_id: @_role_id) || []
	end

	# Update the user for the specified username with the corresponding role
	# Information is taken from administration index page
	def assign_role
		_username = user_params[:username]
		_role_id = role_params[:role_id]
		user = User.where(username: _username).first
		user.role_id = _role_id
		user.save
		redirect_to :administrations 
	end

	def unassign_role
		user = User.find(params[:id])
		user.role_id = 4
		user.save
		redirect_to :administrations
	end

	def user_params
		params.require(:user).permit(:username)
	end

	def role_params
		params.require(:role).permit(:role_id)
	end
end
