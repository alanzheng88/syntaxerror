class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :vendor, limit: 30
      t.integer :locationkey

      t.timestamps
    end
  end
end
