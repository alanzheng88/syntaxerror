require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user1 = users(:alan)
    @user2 = users(:bob)
  end

  def teardown
  end

  # test username
  test "should not be able to create user without username" do
    @user1.username = nil
    assert_not @user1.save, "Expected username to be set."
  end

  test "should not be able to create user with existing username" do
    @user1.save
    @user2.username = "alanz"
    assert_not @user2.save, "Expected username which does not already exist."
  end

  # test email
  test "should not be able to create user without email" do
    @user1.email = nil
    assert_not @user1.save, "Expected email to be set."
  end

  test "should not be able to create user with existing email" do
    @user1.email = "alanz@sfu.ca"
    @user1.save
    @user2.email = "alanz@sfu.ca"
    assert_not @user2.save, "Expected email which does not already exist."
  end

  test "should not be able to create user without @ symbol in email" do
    @user1.email = "alanzsfu.ca"
    assert_not @user1.save, "Expected missing @ symbol."
  end

  test "should not be able to create user without name preceding @ symbol" do
    @user1.email = "@sfu.ca"
    assert_not @user1.save, "Expected name preceding @ symbol."
  end

  test "should not be able to create user without domain following @symbol" do
    @user1.email = "alanz@"
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

  # test admin?
  test "admin_return_value_for_site_admininistrator" do
    @user1.role.name = "Site Administrator"
    assert @user1.admin?, "Expected role to be Site Administrator."
  end

  test "admin_return_value_for_vendor_administrator" do
    @user1.role.name = "Vendor Administrator"
    assert @user1.admin?, "Expected role to be Vendor Administrator."
  end

  # test manager?
  test "manager_return_value_for_vendor_manager" do
    @user1.role.name = "Vendor Manager"
    assert @user1.manager?, "Expected role to be Vendor Manager"
  end

end