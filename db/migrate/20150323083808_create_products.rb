class CreateProducts < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'products'
	drop_table :products
    end

    create_table :products do |t|
      t.string :name, limit: 30
      t.decimal :price, precision: 10, scale: 2
      t.references :brand, index: true
      t.references :category, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
