require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user1 = users(:alan)
    @user2 = users(:bob)
  end

  # test username
  test "should not be able to create user without username" do
    @user1.username = nil
    assert_not @user1.save, "Expected username to be set."
  end

  test "should not be able to create user with existing username" do
    @user1.username = "test_username"
    @user1.save
    @user2.username = "test_username"
    assert_not @user2.save, "Expected username which does not already exist."
  end

  # test email
  test "should not be able to create user without email" do
    @user1.email = nil
    assert_not @user1.save, "Expected email to be set."
  end

  test "should not be able to create user with existing email" do
    @user1.email = "test_username@sfu.ca"
    @user1.save
    @user2.email = "test_username@sfu.ca"
    assert_not @user2.save, "Expected email which does not already exist."
  end

  test "should not be able to create user without @ symbol in email" do
    @user1.email = "test_usernamesfu.ca"
    assert_not @user1.save, "Expected missing @ symbol."
  end

  test "should not be able to create user without name preceding @ symbol" do
    @user1.email = "@sfu.ca"
    assert_not @user1.save, "Expected name preceding @ symbol."
  end

  test "should not be able to create user without domain following @symbol" do
    @user1.email = "test_username@"
    assert_not @user1.save, "Expected domain following @ symbol."
  end

  # test lastname
  test "should be able to create user with empty lastname" do
    @user1.lastname = nil
    assert @user1.save, "Expected lastname to be null."
  end

  # test password
  test "should not be able to create user with password less than 8 characters" do
    @user1.password = "passwrd"
    assert_not @user1.save, "Expected password to be set with more 7 characters."
  end

  test "should not be able to create user with password more than 16 characters" do
    @user1.password = "thisisthepassword"
    assert_not @user1.save, "Expected password to be set with less than 17 characters."
  end

  test "should be able to create user with password length 8 to 16 inclusive" do
    @user1.password = "test_password"
    assert @user1.save, "Expected password to be set"
  end

  # test role
  test "should not be able to create or update user with no role" do
    @user1.role = nil
    assert_not @user1.save, "Expected role to be set."
  end

  # test vendor
  test "should be able to create or update user with no vendor" do
    @user1.vendor = nil
    assert @user1.save, "Expected vendor to be null."
  end

  # test authenticate
  test "authentication should return user when username and password can be found in database" do
    @user1.username = "test_username"
    @user1.password = "test_password"
    @user1.save
    @user2 = User.authenticate("test_username", "test_password")
    assert_equal @user1, @user2, "Username and/or password cannot be found."
  end

  test "authentication should return false when username and/or password does not match any entry in database" do
    @user1.username = "test_username"
    @user1.password = "test_password"
    @user1.save
    @user2 = User.authenticate("some_other_username", "some_other_password")
    assert_equal false, @user2, "Expected false since username and/or password does not match any entry in database."
  end

  # test match_password
  test "match_password" do
    @user1.password = "test_password"
    assert_equal true, @user1.match_password("test_password")
  end

  # test admin?
  test "admin_return_value_for_site_admininistrator" do
    @user1.role.name = User.site_admin
    assert_equal true, @user1.admin?, "Expected role to be Site Administrator."
  end

  test "admin_return_value_for_vendor_administrator" do
    @user1.role.name = User.vendor_admin
    assert_equal true, @user1.admin?, "Expected role to be Vendor Administrator."
  end

  # test manager?
  test "manager_return_value_for_vendor_manager" do
    @user1.role.name = User.vendor_manager
    assert_equal true, @user1.manager?, "Expected role to be Vendor Manager."
  end

  # test get_rolename
  test "user_get_role_name_for_site_admin" do
    @user1.role.name = User.site_admin
    assert_equal "Site Administrator", @user1.get_role_name
  end
  test "user_get_role_name_for_vendor_admin" do
    @user1.role.name = User.vendor_admin
    assert_equal "Vendor Administrator", @user1.get_role_name
  end
  test "user_get_role_name_for_vendor_manager" do
    @user1.role.name = User.vendor_manager
    assert_equal "Vendor Manager", @user1.get_role_name
  end
  test "user_get_role_name_for_user" do
    @user1.role.name = User.user
    assert_equal "User", @user1.get_role_name
  end

end