class AddVendorRefToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :vendor, index: true
  end
end
