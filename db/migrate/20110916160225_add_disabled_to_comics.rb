class AddDisabledToComics < ActiveRecord::Migration
  def change
    add_column :comics, :disabled, :boolean, :default => false
  end
end
