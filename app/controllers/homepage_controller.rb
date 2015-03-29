# /controllers/homepage_controller.rb

class HomepageController < ApplicationController

	# POST /
	def login_attempt
		authorized_user = User.authenticate(login_params[:username], login_params[:password])
		if authorized_user
			flash[:notice] = "Welcome, you logged in as #{authorized_user.username}"
			session[:username] = authorized_user.username
			session[:role] = authorized_user.role.role
			session[:isAuthenticated] = true
		else
			flash[:notice] = "Invalid Username or Password"
		end
		redirect_to root_path
	end

	def login_params
		params.require(:login).permit(:username, :password)
	end
end
