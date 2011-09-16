class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.text :body
      t.datetime :post_date
      t.timestamps
    end
  end
end
