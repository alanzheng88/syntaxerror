class RemoveUserlistkeyFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :userlistkey, :integer
  end
end
