class CreateFeedings < ActiveRecord::Migration
  def change
    create_table :feedings do |t|
      t.integer :child_id
      t.datetime :feeding_time
      t.decimal :amount, :precision => 4, :scale => 2
      t.string :unit, :limit => 64

      t.timestamps
    end
    add_index :feedings, :child_id
  end
end
