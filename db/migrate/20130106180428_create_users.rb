class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :time_zone, :default => 'Eastern Time (US & Canada)'
      t.string :role

      t.timestamps
    end
    add_index :users, :role
  end
end
