# /models/user.rb

class User < ActiveRecord::Base
	belongs_to :role
	belongs_to :vendor
	validates_presence_of :username, :firstname, :password, :email, :role
	validates_confirmation_of :password
	validates_length_of :password, minimum: 8, maximum: 16
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_uniqueness_of :username, :email

	def self.authenticate(username, login_password)
		user = User.find_by_username(username)
		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end

	def match_password(login_password)
		return self.password == login_password
	end

	def admin?
		return self.role.name == "Site Administrator" || self.role.name == "Vendor Administrator" 
	end

	def manager?
		return self.role.name == "Vendor Manager"
	end

	# Get inventory of all products, quantity, and unit 
	# price associated with a vendor
	def get_vendor_inventory_products
		is_unassigned_vendor = self.vendor.nil?
		if is_unassigned_vendor
			return []
		else
			_inventory = self.vendor.inventory
			return _inventory.products
		end
	end

	def self.site_admin
		return 'Site Administrator'
	end

	def self.vendor_admin
		return 'Vendor Administrator'
	end

	def self.vendor_manager
		return 'Vendor Manager'
	end

	def self.user
		return 'User'
	end

	def get_role_name
		return self.role.name
	end

	# Get all products associated to a vendor of a user
	# def get_vendor_product_names_and_counts
	# 	product_names = []
	# 	_sales = self.vendor.sales
	# 	_sales.each do |sale|
	# 		_product_name = Product.where(name: sale.product).first.name
	# 		product_names |= [_product_name]
	# 	end

	# 	products_and_count_hash = {}

	# 	product_names.each do |_product_name|
	# 		_count = _sales.where(product: _product_name).count
	# 		products_and_count_hash[_product_name] = _count
	# 	end
		
	# 	return products_and_count_hash
	# end

end