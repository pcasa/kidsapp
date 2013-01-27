class CreateDrVisitShots < ActiveRecord::Migration
  def change
    create_table :dr_visit_shots do |t|
      t.integer :dr_visit_id
      t.integer :dosage_id

      t.timestamps
    end
    add_index :dr_visit_shots, :dr_visit_id
    add_index :dr_visit_shots, :dosage_id
  end
end
