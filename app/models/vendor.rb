# /models/vendor.rb

class Vendor < ActiveRecord::Base
	has_many :users
	has_many :sales, dependent: :delete_all
	belongs_to :inventory, dependent: :destroy
  after_initialize :create_inventory
  before_destroy :delete_inventory
  
  def create_inventory
    self.attributes ||= {inventory: Inventory.create}
  end

	def vendor_name
		return name
	end

  def delete_inventory
    self.inventory.destroy
  end
end