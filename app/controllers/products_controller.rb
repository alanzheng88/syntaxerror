# /controllers/products_controller.rb

class ProductsController < ApplicationController

	before_action :ensure_product_manager!, except: [:index, :show]
	before_action :get_product, only: [:index, :show, :destroy]

	def ensure_product_manager!
		unless @current_user.admin? || @current_user.manager?
			flash[:homepage_status] = "Unauthorized access to this page"
			redirect_to root_path
		end
	end

	def get_product
		@products = Product.all
	end

	# Display list of all products which are currently available for selling
	# GET /products 		:products
	def index
	end

	# GET /product/:id 		:product
	def show
		@product = @products.find(params[:id])
	end

	# DELETE /product/:id
	def destroy
		_product = @products.find(params[:id])
		_product.destroy
		redirect_to :product_management
	end

	# Display product management page for managing products
	# GET /product-management	:product_management
	def new
		@categories = Category.all
		if @current_user.vendor
			@vendor_name = @current_user.vendor.name
		end
		@vendor_inventory_products = @current_user.get_vendor_inventory_products
	end

	# Create a new product for a vendor
	# POST /product-management
	def create
		if @current_user.vendor.nil?
			flash[:create_product_status] = 
				"Sorry a product cannot be added until you are assigned a vendor. 
				Please seek a Site Administrator for further assistance."
			redirect_to :product_management and return
		end

		begin
			_vendor = @current_user.vendor
			product = product_params
			brand_id = params.require(:brand).permit(:brand_id)[:brand_id]
			category_id = params.require(:category).permit(:category_id)[:category_id]
			_name = product[:name]
			product_to_create = Product.new(name: _name,
									brand: Brand.find(brand_id),
									category: Category.find(category_id),
									quantity: product[:quantity],
									unitprice: product[:unitprice])
			_vendor.inventory.products << product_to_create

			if _vendor.save
				flash[:create_product_status] = "Successfully added product"
			end
		rescue
			flash[:create_product_status] = "An error occurred."
		ensure
			redirect_to :product_management
		end
	end

	def product_params
		params.require(:product).permit(:name, :unitprice, :quantity)
	end

	private :product_params
end