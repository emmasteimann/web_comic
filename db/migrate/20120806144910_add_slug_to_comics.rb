class AddSlugToComics < ActiveRecord::Migration
  def change
    add_column :comics, :slug, :string
    add_index :comics, :slug, unique: true
  end
end
