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

end