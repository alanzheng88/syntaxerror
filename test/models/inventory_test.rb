require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  
  def setup
     @vendor = Vendor.create
  end

  test "inventory should be created automatically upon vendor creation" do
    assert_equal true, @vendor.inventory.present?, "Expected inventory to be created for vendor"
  end

  test "inventory should be deleted automatically upon vendor deletion" do
    _inventory_id = @vendor.inventory_id
    @vendor.destroy
    _inventory = Inventory.where(id: _inventory_id).first
    assert_nil _inventory, "Expect no associated inventory remnants after vendor deletion"
  end
end
