class CreateProductListings < ActiveRecord::Migration
  def change
    create_table :product_listings do |t|

      t.timestamps
    end
  end
end
