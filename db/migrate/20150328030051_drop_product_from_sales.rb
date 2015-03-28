class DropProductFromSales < ActiveRecord::Migration
  def change
	remove_column :sales, :product
  end
end
