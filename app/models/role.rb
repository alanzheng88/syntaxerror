# /models/role.rb

class Role < ActiveRecord::Base
	has_many :users
	
	def role_name
		return role
	end
end
