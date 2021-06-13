class AddRudyLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rudy_last_name, :string
  end
end
