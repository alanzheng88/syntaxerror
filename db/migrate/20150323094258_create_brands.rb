class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, limit: 30

      t.timestamps
    end
    add_index :brands, :name, unique: true
  end
end
