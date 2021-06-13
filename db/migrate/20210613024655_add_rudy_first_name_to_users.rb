class AddRudyFirstNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rudy_first_name, :string
  end
end
