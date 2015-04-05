require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  
  def setup
    @_user = users(:alan)
    product1 = products(:quickwatch)
    product2 = products(:smartcell)
    product3 = products(:smartgear)
    sale1 = Sale.new
    sale1.products << product1 << product2
    sale2 = Sale.new
    sale2.products << product3
    @_user.vendor.sales << sale1 << sale2
  end

  # test product sales
  test "should delete associated product sales when sale is deleted" do
    _sale_id = @_user.vendor.sales.first.id
    @_user.vendor.sales.first.destroy
    product_sales_count = ProductsSale.where(sale_id: _sale_id).count
    assert_equal 0, product_sales_count, "Expected all products sales associated to sale to be deleted"
  end

  # test product
  test "should not delete products when sale is deleted" do
    # Need to convert ActiveRecord entry to array because otherwise it will do an 
    # inner join with products_sales when querying products using product id later on
    _product_ids = @_user.vendor.sales.first.products.select(:id).to_a
    @_user.vendor.sales.first.destroy
    product_count = Product.where(id: _product_ids).count
    assert_equal 2, product_count, "Expected products not to be deleted when sale is deleted"
  end

  # test vendor
  test "should not create sale without having association to vendor" do
    _sale = Sale.new
    assert_not _sale.save, "Expected vendor_id to be assigned to sale."
  end
end
