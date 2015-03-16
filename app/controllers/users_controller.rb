class UsersController < ApplicationController

	def new
		User.create(username: params[:username],
			firstname: params[:firstname],
			lastname: params[:lastname],
			password: params[:secret],
			email: params[:email],
			rolekey: 4)
		redirect_to root_path
	end

end
