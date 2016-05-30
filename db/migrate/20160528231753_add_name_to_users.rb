class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :is_lender, :boolean, default: false
  end
end
