class Vendor < ActiveRecord::Base
	has_many :users
	has_many :sales
	belongs_to :inventory
end
