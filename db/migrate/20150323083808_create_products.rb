class CreateProducts < ActiveRecord::Migration
  def change
    drop_table :products
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
