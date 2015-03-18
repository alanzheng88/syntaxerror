class RegistrationsController < ApplicationController
	
	def index
		user_columns_to_delete = ['id', 'userlistkey', 'created_at', 'updated_at', 'role_id']
		@user_columns = column_names_with_exclusions(User.column_names, user_columns_to_delete)
	end

end