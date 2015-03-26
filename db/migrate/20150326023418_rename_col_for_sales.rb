class RenameColForSales < ActiveRecord::Migration
  def change
	rename_column :sales, :products, :product
  end
end
