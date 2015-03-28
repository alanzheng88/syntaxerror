class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  has_and_belongs_to_many :sales
  # has_and_belongs_to_many :inventories
  has_many :inventories_products
  has_many :inventories, through: :inventories_products, dependent: :delete_all

  validates_presence_of :name, :brand_id, :category_id
  validates_numericality_of :brand_id, :category_id
end