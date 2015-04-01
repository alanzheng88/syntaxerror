# /controllers/administration_controller.rb

class AdministrationsController < ApplicationController

	before_action :ensure_admin!

	# GET /administrations		:administrations
	def index
		# Filter display of assigned users based on role.
		# Site Administrator can only see vendor administrators
		# and vendor managers.
		# Vendor Administrators can only see vendor managers.
		if session[:role] == 'Site Administrator'
			_role_id = [Role.get_vendor_admin_id, Role.get_vendor_manager_id]
		elsif session[:role] == 'Vendor Administrator'
			_role_id = [Role.get_vendor_manager_id]
		end
		@roles_to_display = Role.where(id: _role_id)
		@vendors_to_display = Vendor.all
		@user_list = User.where(role_id: _role_id) || []
	end

	def ensure_admin!
		unless @current_user.admin?
			flash[:homepage_status] = "Unauthorized access to this page"
			redirect_to root_path
		end
	end
end