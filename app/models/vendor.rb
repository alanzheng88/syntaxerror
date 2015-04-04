# /models/vendor.rb

class Vendor < ActiveRecord::Base
	has_many :users
	has_many :sales, dependent: :delete_all
	belongs_to :inventory, dependent: :destroy

	def vendor_name
		return name
	end
end