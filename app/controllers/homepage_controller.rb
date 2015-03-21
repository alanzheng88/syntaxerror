class HomepageController < ApplicationController

	def authenticate
		
		session[:isAuthenticated] ||= false 
		if !session[:isAuthenticated]
			session[:username] = params[:username]
			session[:role] = params[:role]
			session[:isAuthenticated] = !session[:username].nil?
		end

		render 'index'
	end

end
