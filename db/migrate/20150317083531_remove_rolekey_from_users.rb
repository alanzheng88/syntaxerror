class RemoveRolekeyFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :rolekey, :integer
  end
end
