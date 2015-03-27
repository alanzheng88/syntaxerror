class RemoveProductkeyFromVendors < ActiveRecord::Migration
  def change
    remove_column :vendors, :productkey, :integer
  end
end
