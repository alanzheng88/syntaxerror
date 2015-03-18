class RegistrationsController < ApplicationController
	
	def index
		userColumnsToDelete = ['id', 'userlistkey', 'created_at', 'updated_at', 'role_id']
		@userColumns = column_names_with_exclusions(User.column_names, userColumnsToDelete)
	end

end