class Inventory < ActiveRecord::Base
	has_one :vendor
	# has_and_belongs_to_many :products
	has_many :inventories_products
	has_many :products, through: :inventories_products
end
