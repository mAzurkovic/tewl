class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :tool
      t.decimal :price
      t.string :location

      t.timestamps null: false
    end
  end
end
