class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :name
      t.string :brand
      t.text :description
      t.integer :price
      t.boolean :availability, default: true

      t.timestamps null: false
    end
  end
end
