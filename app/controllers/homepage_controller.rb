class HomepageController < ApplicationController

def index
	# username = params[:username]
	# role = params[:role]
	# @isAuthenticated = !username.nil?
	# user = Homepage.new(username, role)
	if !cookies[:isAuthenticated]
		cookies[:username] = { :value => params[:username], :expires => 60.seconds.from_now}
		cookies[:role] = { :value => params[:role], :expires => 60.seconds.from_now}
		cookies[:isAuthenticated] = { :value => !cookies[:username].nil?, :expires => 60.seconds.from_now}
	end
end

end
