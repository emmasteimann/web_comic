class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :alt_text

      t.timestamps
    end
  end
end
