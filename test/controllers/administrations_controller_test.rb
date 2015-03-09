require 'test_helper'

class AdministrationsControllerTest < ActionController::TestCase
  setup do
    @administration = administrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration" do
    assert_difference('Administration.count') do
      post :create, administration: {  }
    end

    assert_redirected_to administration_path(assigns(:administration))
  end

  test "should show administration" do
    get :show, id: @administration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration
    assert_response :success
  end

  test "should update administration" do
    patch :update, id: @administration, administration: {  }
    assert_redirected_to administration_path(assigns(:administration))
  end

  test "should destroy administration" do
    assert_difference('Administration.count', -1) do
      delete :destroy, id: @administration
    end

    assert_redirected_to administrations_path
  end
end
