class HomepageController < ApplicationController

	def login_attempt
		authorized_user = User.authenticate(params[:username], params[:login_password])
		if authorized_user
			flash[:notice] = "Welcome, you logged in as #{authorized_user.username}"
			session[:username] = authorized_user.username
			session[:role] = authorized_user.role.role
			session[:isAuthenticated] = true
		else
			flash[:notice] = "Invalid Username or Password"
		end
		redirect_to root_path

		# session[:isAuthenticated] ||= false 
		# if !session[:isAuthenticated]
		# 	session[:username] = params[:username]
		# 	session[:role] = params[:role]
		# 	session[:isAuthenticated] = !session[:username].nil?
		# end
		# render 'index'
	end

end
