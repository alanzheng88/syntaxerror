class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :vendor, limit: 30
      t.integer :locationKey

      t.timestamps
    end
  end
end
