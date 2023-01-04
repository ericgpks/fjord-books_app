class DropBookComment < ActiveRecord::Migration[6.1]
  def change
    drop_table :book_comments do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end
