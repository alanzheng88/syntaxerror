class RegistrationsController < ApplicationController
	
	def index
		userColumnsToDelete = ['id', 'rolekey', 'userlistkey', 'created_at', 'updated_at']
		@userColumns = column_names_with_exclusions(User.column_names, userColumnsToDelete)
	end

end