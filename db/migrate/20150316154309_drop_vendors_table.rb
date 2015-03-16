class DropVendorsTable < ActiveRecord::Migration
  def up
	drop_table :vendors
  end

  def down
	raise ActiveRecord::IrreversibleMigration
  end
end
