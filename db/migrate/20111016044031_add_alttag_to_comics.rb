class AddAlttagToComics < ActiveRecord::Migration
  def change
    add_column :comics, :alt_tag, :string
  end
end
