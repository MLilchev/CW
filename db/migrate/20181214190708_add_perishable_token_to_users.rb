class AddPerishableTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :perishable_token, :string
  end
end
