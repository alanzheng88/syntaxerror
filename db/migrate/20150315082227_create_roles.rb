class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role, limit: 30

      t.timestamps
    end
  end
end
