require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  def setup
    @brand = brands(:xiaowei)
  end

  test "should not create brand without name" do
    @brand.name = nil
    assert_not @brand.save, "Expected name for brand."
  end

  test "brand names should be unique" do
    _brand = Brand.new
    _brand.name = "Xiaowei Inc"
    assert_not _brand.save, "Expected brand name which does not already exist in the database."
  end
end
