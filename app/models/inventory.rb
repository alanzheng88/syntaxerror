# /models/inventory.rb

class Inventory < ActiveRecord::Base
	has_one :vendor
	has_many :inventories_products
	has_many :products, through: :inventories_products
end
