class Vendor < ActiveRecord::Base
	has_many :users
	has_many :sales
end
