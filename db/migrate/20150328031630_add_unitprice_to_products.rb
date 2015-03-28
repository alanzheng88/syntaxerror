class AddUnitpriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :unitprice, :decimal, precision: 10, scale: 2, default: 0
  end
end
