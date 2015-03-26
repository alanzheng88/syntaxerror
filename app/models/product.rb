class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  has_and_belongs_to_many :sales
end