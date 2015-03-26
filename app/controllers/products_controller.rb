class ProductsController < ApplicationController

	before_action :get_product, only: [:index, :show, :edit, :update, :destroy]
	
	def get_product
		@products = Product.all
	end

	def show
		@product = @products.find(params[:id])
	end

	# add a new product to the product management page
	def new
		@categories = Category.all
		@vendor_name = @user.vendor.name if @user.vendor.present?
		@vendor_products_and_counts = @user.get_vendor_product_names_and_counts
	end

	def destroy
		product_to_delete = @products.find(params[:id])
		product.destroy
	end

end