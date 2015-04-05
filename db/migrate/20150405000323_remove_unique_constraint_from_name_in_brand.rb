class RemoveUniqueConstraintFromNameInBrand < ActiveRecord::Migration
  def change
		remove_index :brands, :name
		add_index :brands, :name
  end
end
