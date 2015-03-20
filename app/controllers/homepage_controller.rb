class HomepageController < ApplicationController

	def authenticate
		
		cookies[:isAuthenticated] ||= false 
		if !cookies[:isAuthenticated]
			cookies[:username] = { :value => params[:username], :expires => 1.hour.from_now }
			cookies[:role] = { :value => params[:role], :expires => 1.hour.from_now }
			cookies[:isAuthenticated] = { :value => !cookies[:username].nil?, :expires => 1.hour.from_now }
		end

		render 'index'
	end

end
