# /controllers/homepage_controller.rb

class HomepageController < ApplicationController

	def get_current_user
		if session[:user_id]
		  current_user = User.find(session[:user_id])
		  return current_user
		end
	end

	# GET /
	def login
		@current_user = get_current_user
	end

	# POST /
	def login_attempt
		authenticated_user = User.authenticate(login_params[:username], login_params[:password])
		if authenticated_user
			flash[:notice] = "Welcome, you logged in as #{authenticated_user.username}"
			session[:user_id] = authenticated_user.id
			session[:role] = authenticated_user.role.role
			session[:is_authenticated] = true
		else
			flash[:notice] = "Invalid Username or Password"
		end
		redirect_to root_path
	end

	def login_params
		params.require(:user).permit(:username, :password)
	end

	# DELETE /    :sign_out
	def sign_out
		super
		redirect_to root_path
	end
end
