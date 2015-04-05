require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product1 = products(:quickwatch)
  end

  # test name
  test "should not be able to create product with unassigned value for product name" do
    @product1.name = nil
    assert_not @product1.save, "Expected product name to be set"
  end

  # test brand id
  test "should not be able to create product with unassigned value for brand id" do
    @product1.brand_id = nil
    assert_not @product1.save, "Expected product brand id to be set"
  end

  # test brand
  test "should be able to assign brand to product" do
    @product1.brand = brands(:xiaowei)
    assert @product1.save, "Expected brand to be set for product"
  end

  # test category id
  test "should not be able to create product with unassigned value for category id" do
    @product1.category_id = nil
    assert_not @product1.save, "Expected product category id to be set"
  end

  # test category
  test "should be able to assign category to product" do
    @product1.category = categories(:wearable_tech)
    assert @product1.save, "Expected category to be set for product"
  end

  # test sales
  test "should be able to create many sales for product" do
    3.times do
      @product1.sales << Sale.new(vendor_id: 1)
    end
    assert_equal 3, @product1.sales.length, "Expected multiple sales entries for product"
  end

  test "should be able to have no sales for product" do
    @product1.sales.delete_all
    _count = @product1.sales.count
    assert_equal 0, _count, "Expected a zero count for product sales"
  end
  
end
