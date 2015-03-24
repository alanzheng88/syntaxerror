class AddDefaultValueToProductsColumn < ActiveRecord::Migration
  def up
	change_column :products, :quantity, :integer, default: 1
	Product.update_all(quantity: 1)
  end

  def down
	change_column :products, :quantity, :integer, default: nil
	Product.update_all(quantity: nil)
  end
end
