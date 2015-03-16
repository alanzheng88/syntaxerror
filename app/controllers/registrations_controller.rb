class RegistrationsController < ApplicationController
	
	def index
		@keys = ['id', 'rolekey', 'userlistkey', 'created_at', 'updated_at']
		@userColumns = User.column_names.delete_if{|name| @keys.include?(name)}
	end

end