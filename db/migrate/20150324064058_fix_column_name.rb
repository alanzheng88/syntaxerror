class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :vendors, :vendor, :name
  end
end
