# /controllers/administration_controller.rb

class AdministrationsController < ApplicationController

	before_action :ensure_admin!

	# GET /administrations		:administrations
	def index
		@_role_id = []
		if session[:role] == 'Site Administrator'
			@_role_id = [2,3]
		elsif session[:role] == 'Vendor Administrator'
			@_role_id = [3]
		end
		@user_list = User.where(role_id: @_role_id) || []
	end

	def ensure_admin!
		unless @current_user.admin?
			flash[:homepage_status] = "Unauthorized access to this page"
			redirect_to root_path
		end
	end
end