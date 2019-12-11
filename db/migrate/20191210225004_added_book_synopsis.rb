class AddedBookSynopsis < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :synopsis, :text
    change_column_null(:books, :synopsis, false)
  end
end
