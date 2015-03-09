class CreateAdministrations < ActiveRecord::Migration
  def change
    create_table :administrations do |t|

      t.timestamps
    end
  end
end
