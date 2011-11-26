class RenameComicAssets < ActiveRecord::Migration
  def down
    rename_table :assets, :comic_assets
  end

  def up
    rename_table :comic_assets, :assets
  end
end
