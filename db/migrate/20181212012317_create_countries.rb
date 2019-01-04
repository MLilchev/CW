class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :country
      t.string :country_formal
      t.integer :population
      t.integer :gdp
      t.string :economy_type
      t.string :income_level
      t.string :region
      t.float :lon
      t.float :lat

      t.timestamps
    end
  end
end
