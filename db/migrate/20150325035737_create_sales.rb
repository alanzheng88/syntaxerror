class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :products, limit: 30
      t.decimal :sumtotal, precision: 10, scale: 2

      t.timestamps
    end
  end
end
