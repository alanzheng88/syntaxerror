require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = categories(:wearable_tech)
  end

  test "should not create category without name" do
    @category.name = nil
    assert_not @category.save, "Expected name for category."
  end

  test "category names should be unique" do
    _category = Category.new
    _category.name = "Wearable Tech"
    assert_not _category.save, "Expected category name which does not already exist in the database."
  end
end
