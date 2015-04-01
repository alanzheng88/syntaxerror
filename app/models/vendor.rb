# /models/vendor.rb

class Vendor < ActiveRecord::Base
	has_many :users
	has_many :sales
	belongs_to :inventory

	def vendor_name
		return name
	end
end
