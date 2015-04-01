# /models/role.rb

class Role < ActiveRecord::Base
	has_many :users

	# Get the role id for a specified role name
	# Current options for role name are the following:
	# 		Site Administrator
	# 		Vendor Administrator
	# 		Vendor Manager
	# 		User
	def self.get_role_id(role_name)
		_role = Role.where(role: role_name).first
		return _role.id
	end

	def self.get_site_admin_id
		return get_role_id('Site Administrator')
	end

	def self.get_vendor_admin_id
		return get_role_id('Vendor Administrator')
	end

	def self.get_vendor_manager_id
		return get_role_id('Vendor Manager')
	end

	def self.get_user_id
		return get_role_id('User')
	end

	def role_name
		return role
	end

	private_class_method :get_role_id

end
