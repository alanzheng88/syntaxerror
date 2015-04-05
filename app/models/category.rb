# /models/category.rb

class Category < ActiveRecord::Base
	has_many :products
  validates :name, presence: true,
                  uniqueness: :name

	def category_name
		return name
	end
end