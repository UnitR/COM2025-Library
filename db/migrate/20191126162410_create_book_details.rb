class CreateBookDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :book_details do |t|
      t.integer :book_id
      t.string :edition
      t.string :isbn

      t.timestamps
    end
  end
end
