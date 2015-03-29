# /models/category.rb

class Category < ActiveRecord::Base
	has_many :products

	def category_name
		return name
	end
end