class ChangeColumn < ActiveRecord::Migration
  def up
	change_column :users, :role_id, :integer, default: 4
  end

  def down
	change_column :users, :role_id, :integer, default: nil
  end 
end
