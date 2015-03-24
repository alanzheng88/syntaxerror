class CreateCategories < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'categories'
	drop_table :categories
    end

    create_table :categories do |t|
      t.string :name, limit: 30

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
