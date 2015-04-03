require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  
  def setup
    @user1 = users(:alan)
    @user2 = users(:bob)
  end

  test "get site admin id should return correct id" do
    _role = Role.where(name: "Site Administrator").first
    expected_role_id = _role.id
    actual_role_id = Role.get_site_admin_id
    assert_equal expected_role_id, actual_role_id
  end

  test "get vendor admin id should return correct id" do
    _role = Role.where(name: "Vendor Administrator").first
    expected_role_id = _role.id
    actual_role_id = Role.get_vendor_admin_id
    assert_equal expected_role_id, actual_role_id
  end

  test "get vendor manager id should return correct id" do
    _role = Role.where(name: "Vendor Manager").first
    expected_role_id = _role.id
    actual_role_id = Role.get_vendor_manager_id
    assert_equal expected_role_id, actual_role_id
  end

  test "get user id should return correct id" do
    _role = Role.where(name: "User").first
    expected_role_id = _role.id
    actual_role_id = Role.get_user_id
    assert_equal expected_role_id, actual_role_id
  end
end
