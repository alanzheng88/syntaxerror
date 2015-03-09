class HomepageController < ApplicationController

def index
	username = params[:username]
	role = params[:role]
	@isAuthenticated = !username.nil?
	@user = Homepage.new(username, role)
end

end
