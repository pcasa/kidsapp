class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.integer :user_id
      t.integer :birth_month
      t.integer :birth_year
      t.timestamps
    end
    add_index :children, :user_id
  end
end
