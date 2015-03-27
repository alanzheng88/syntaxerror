class AddInventoryRefToVendor < ActiveRecord::Migration
  def change
    add_reference :vendors, :inventory, index: true
  end
end
