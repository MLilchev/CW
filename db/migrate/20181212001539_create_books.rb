class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.integer :isbn
      t.string :region
      t.float :rating
      t.float :price
      t.string :image

      t.timestamps
    end
    #add_index :books, :country_id
  end
end
