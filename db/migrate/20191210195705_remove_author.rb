class RemoveAuthor < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :author_id
    add_column :books, :author_name, :string
    change_column_null(:books, :author_name, false)
  end
end
