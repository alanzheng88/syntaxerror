class AdministrationsController < ApplicationController

	def index
		# vendor_administrators = User.where(role_id: 2)
		# vendor_managers = User.where(role_id: 3)
		# users = User.where(role_id: 4)
		@user_list = []
		if cookies[:role] == 'Site Administrator'
			#@user_list = [vendor_administrators, vendor_managers, users].flatten
			@user_list = User.where(role_id: [2,3])
		elsif cookies[:role] == 'Vendor Manager'
			#@user_list = [vendor_managers, users].flatten
			@user_list = User.where(role_id: [3])
		end
	end

	# Update the user for the specified username with the corresponding role
	# Information is taken from administration index page
	def assign_role
		_username = user_params[:username]
		_role_id = role_params[:role_id]
		puts "params username: #{user_params[:username]}"
		puts "username: #{_username}"
		puts "role id: #{_role_id}"
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
