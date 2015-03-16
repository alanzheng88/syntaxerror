class ProductsController < ApplicationController

	before_action :get_product, only: [:index, :show, :edit, :update, :destroy]
	
	def get_product
		@products = Product.all
	end

	def index
	end

	def show
		@product = @products.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
		product_to_delete = @products.find(params[:id])
		product.destroy
	end

end
