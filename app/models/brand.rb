# /models/brand.rb

class Brand < ActiveRecord::Base
	has_many :products

	def brand_name
		return name
	end
end
