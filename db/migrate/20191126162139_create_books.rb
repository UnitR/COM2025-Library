class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :genre_id
      t.integer :author_id
      t.string :book_name
      t.boolean :in_series
      t.integer :seq_in_series

      t.timestamps
    end
  end
end
