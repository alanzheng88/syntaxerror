class DropVendorsTable < ActiveRecord::Migration
  def up
	drop_table :vendors
  end

  def down
	create_table :vendors
  end
end
