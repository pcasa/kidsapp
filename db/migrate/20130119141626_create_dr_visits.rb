class CreateDrVisits < ActiveRecord::Migration
  def change
    create_table :dr_visits do |t|
      t.integer :child_id
      t.date :appointment

      t.timestamps
    end
    add_index :dr_visits, :child_id
    add_index :dr_visits, :appointment
  end
end
