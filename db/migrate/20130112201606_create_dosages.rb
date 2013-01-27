class CreateDosages < ActiveRecord::Migration
  def change
    create_table :dosages do |t|
      t.boolean :annual, :default => false
      t.integer :vaccine_id
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
    add_index :dosages, :vaccine_id
    add_index :dosages, :min_age
    add_index :dosages, :max_age
  end
end
