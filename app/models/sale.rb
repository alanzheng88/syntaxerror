# /models/sale.rb

class Sale < ActiveRecord::Base
	has_and_belongs_to_many :products
	belongs_to :vendor
end
