class CreateBowelMovements < ActiveRecord::Migration
  def change
    create_table :bowel_movements do |t|
      t.integer :child_id
      t.datetime :bowel_time
      t.string :consistency
      t.string :color

      t.timestamps
    end
    add_index :bowel_movements, :child_id
  end
end
