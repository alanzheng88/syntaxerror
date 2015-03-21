class Role < ActiveRecord::Base
	has_many :users
	def name_with_initial
		role
	end
end
