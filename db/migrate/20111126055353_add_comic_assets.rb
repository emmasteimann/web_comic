class AddComicAssets < ActiveRecord::Migration
  def change
    create_table :comic_assets do |t|
      t.string :name
      t.string :alt_text

      t.timestamps
    end
  end
end
