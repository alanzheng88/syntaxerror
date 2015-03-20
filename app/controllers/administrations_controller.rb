class AdministrationsController < ApplicationController

	def index
		vendor_administrators = User.where(role_id: 2)
		vendor_managers = User.where(role_id: 3)
		users = User.where(role_id: 4)
		@user_list = []
		if cookies[:role] == 'Site Administrator'
			@user_list = [vendor_administrators, vendor_managers, users].flatten
		elsif cookies[:role] == 'Vendor Manager'
			@user_list = [vendor_managers, users].flatten
		end
	end

end
