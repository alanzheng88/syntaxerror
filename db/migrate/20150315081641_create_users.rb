class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 30
      t.string :firstname, limit: 30
      t.string :lastname, limit: 30
      t.string :password, limit: 30
      t.string :email, limit: 254
      t.integer :rolekey
      t.integer :userlistkey

      t.timestamps
    end
  end
end
