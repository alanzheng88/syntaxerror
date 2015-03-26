class User < ActiveRecord::Base
	belongs_to :role
	belongs_to :vendor
	validates_presence_of :username, :firstname, :password, :email
	validates_confirmation_of :password
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
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

	# Get all products associated to a vendor of a user
	def get_vendor_products
		products = []
		_sales = self.vendor.sales
		_sales.each do |sale|
			_product = Product.where(name: sale.product).first
			products |= [_product]
		end
		return products
	end
end