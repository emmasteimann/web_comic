class RenameAssets < ActiveRecord::Migration
  def up
    rename_table :assets, :comic_assets
  end

  def down
    rename_table :comic_assets, :assets
  end
end
