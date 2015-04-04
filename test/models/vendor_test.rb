require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  
  def setup
    @_user = users(:alan)
    @_user.vendor.sales << sales(:iphone) << sales(:earphones) << sales(:laptop)
    @_user.vendor.inventory = Inventory.create
    @_user.vendor.inventory.products << products(:quickwatch) << products(:smartgear) << products(:smartbook)
  end

  # test sales
  test "should be able to create multiple sales for vendor." do
    sales_count = @_user.vendor.sales.count
    assert_equal 3, sales_count, "Expected multiple sales to be created for vendor."
  end

  test "should delete all associated sales when vendor is deleted." do
    @_user.vendor.destroy
    sales_count = Sale.all.where(vendor_id: @_user.vendor.id).count
    assert_equal 0, sales_count, "Expected all sales to be deleted when associated vendor is deleted."
  end

  # test user
  test "should not delete user when vendor is deleted" do
    @_user.vendor.destroy
    user_count = User.all.where(id: @_user.id).count
    assert_equal 1, user_count, "Expected user to exist after vendor is deleted."
  end

  test "should only have one vendor assigned to each user" do
    is_list_of_vendors = @_user.kind_of?(Array)
    assert_equal false, is_list_of_vendors, "Expected single vendor for user."
  end

  test "should be able to have no vendor assigned to user" do
    @_user.vendor = nil
    assert @_user.save, "Expected no vendor to be assigned to user."
  end

  # test inventory and products
  test "should be able to add multiple products to inventory for vendor" do
    products_count = @_user.vendor.inventory.products.count
    assert_equal 3, products_count, "Expected multiple products to be added to inventory for vendor."
  end

  test "should delete all associated inventory products when vendor is deleted" do
    @_user.vendor.destroy
    product_count = @_user.vendor.inventory.products.count
    assert_equal 0, product_count, "Expected no associated products to exist after vendor is deleted."
  end
end
