class FixSalesColumns < ActiveRecord::Migration
  def change
	rename_column :sales, :sumtotal, :unitprice
	add_column :sales, :quantity, :integer, default: 1
  end
end
