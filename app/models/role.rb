# /models/role.rb

class Role < ActiveRecord::Base
	has_many :users
	
	def name_with_initial
		return role
	end
end
