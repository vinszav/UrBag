class AddSlugsToBags < ActiveRecord::Migration
  def change
    add_column :bags, :slug, :string
    add_index :bags, :slug, unique: true
  end
end
