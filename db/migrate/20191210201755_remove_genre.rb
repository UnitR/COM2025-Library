class RemoveGenre < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :genre_id
  end
end
