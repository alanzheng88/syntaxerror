class ChangeLocationkeyToLocationId < ActiveRecord::Migration
  def change
    rename_column :vendors, :locationkey, :location_id
  end
end
