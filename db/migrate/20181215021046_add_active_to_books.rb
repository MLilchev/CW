class AddActiveToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :active, :boolean
  end
end
