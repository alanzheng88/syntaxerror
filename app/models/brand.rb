# /models/brand.rb

class Brand < ActiveRecord::Base
	has_many :products
  validates :name, presence: true,
                  uniqueness: :name
                  
	def brand_name
		return name
	end
end
