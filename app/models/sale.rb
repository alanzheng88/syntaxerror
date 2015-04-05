# /models/sale.rb

class Sale < ActiveRecord::Base
	has_many :products_sales, dependent: :delete_all
  has_many :products, through: :products_sales
	belongs_to :vendor

  validates_presence_of :vendor_id
end