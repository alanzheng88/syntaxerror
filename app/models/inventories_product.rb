# /models/inventories_product.rb

class InventoriesProduct < ActiveRecord::Base
	belongs_to :inventory
	belongs_to :product
end