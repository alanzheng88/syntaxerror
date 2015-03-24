class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 30

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
