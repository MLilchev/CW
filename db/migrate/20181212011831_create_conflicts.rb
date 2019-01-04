class CreateConflicts < ActiveRecord::Migration[5.2]
  def change
    create_table :conflicts do |t|
      t.integer :conflict_new_id
      t.string :conflict_name
      t.string :country
      t.integer :country_id

      t.timestamps
    end
    add_index :conflicts, :country_id
  end
end
