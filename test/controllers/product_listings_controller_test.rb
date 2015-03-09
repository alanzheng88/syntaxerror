require 'test_helper'

class ProductListingsControllerTest < ActionController::TestCase
  setup do
    @product_listing = product_listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_listing" do
    assert_difference('ProductListing.count') do
      post :create, product_listing: {  }
    end

    assert_redirected_to product_listing_path(assigns(:product_listing))
  end

  test "should show product_listing" do
    get :show, id: @product_listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_listing
    assert_response :success
  end

  test "should update product_listing" do
    patch :update, id: @product_listing, product_listing: {  }
    assert_redirected_to product_listing_path(assigns(:product_listing))
  end

  test "should destroy product_listing" do
    assert_difference('ProductListing.count', -1) do
      delete :destroy, id: @product_listing
    end

    assert_redirected_to product_listings_path
  end
end
