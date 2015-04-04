# /models/product.rb

class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  has_many :products_sales
  has_many :sales, through: :products_sales
  has_many :inventories_products
  has_many :inventories, through: :inventories_products

  validates_presence_of :name, :brand_id, :category_id
  
end