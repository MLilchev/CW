class CreateClashes < ActiveRecord::Migration[5.2]
  def change
    create_table :clashes do |t|
    #  t.integer :clash_id
      t.string :conflict_name
      t.string :dyad_name
      t.string :side_a
      t.string :side_b
      t.string :source_article
      t.string :source_office
      t.string :source_date
      t.string :source_headline
      t.string :source_original
      t.string :location
      t.float :lat
      t.float :lon
      t.string :country
      t.string :region
      t.string :date_start
      t.string :date_end
      t.integer :deaths_a
      t.integer :deaths_b
      t.integer :deaths_unknown
      t.integer :total_deaths
      t.integer :conflict_id

      t.timestamps
    end
    add_index :clashes, :conflict_id
  end
end
