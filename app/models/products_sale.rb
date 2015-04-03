# /models/product_sales.rb

class ProductsSale < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product
end