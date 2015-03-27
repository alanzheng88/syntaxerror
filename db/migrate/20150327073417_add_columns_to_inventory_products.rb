class AddColumnsToInventoryProducts < ActiveRecord::Migration
  def change
	add_column :inventories_products, :quantity, :integer, default: 1
	add_column :inventories_products, :unitprice, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
