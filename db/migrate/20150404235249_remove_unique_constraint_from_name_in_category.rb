class RemoveUniqueConstraintFromNameInCategory < ActiveRecord::Migration
  def change
		remove_index :categories, :name
		add_index :categories, :name
  end
end
