class Homepage < ActiveRecord::Base
	attr_reader :name, :role

	def initialize(name, role)
		@name = name
		@role = role
	end
end
