class SetModelSettings < ActiveRecord::Migration[5.2]
  def change

    # Remove unnecessary columns from model creation
    remove_column :books, :genre_id
    remove_column :books, :author_id
    remove_column :book_details, :book_id
    remove_column :comments, :user_id
    remove_column :comments, :post_id
    remove_column :forum_posts, :user_id

    # Remove unnecessary indices
    # remove_index :book_details, :index_book_details_on_book_id

    # Add missing columns
    add_column :forum_posts, :title, :string

    # Set foreign keys
    add_reference :book_details, :book, index: true, foreign_key: true
    add_reference :books, :author, index: true, foreign_key: true
    add_reference :books, :genre, index: true
    add_reference :comments, :forum_post, index: true, foreign_key: true
    add_reference :comments, :user, index: true, foreign_key: true
    add_reference :forum_posts, :user, index: true, foreign_key: true

    # Add indices
    add_index(:forum_posts, [:id, :title], unique: true)
    add_index(:forum_posts, :title)
    add_index(:forum_posts, :deleted)
    add_index(:comments, [:id, :user_id, :post_id], unique: true)
    add_index(:books, :book_name)
    add_index(:genres, :name, unique: true)

    # ---- Set nullable rules ----
    # Book
    change_column_null(:books, :book_name, false)
    change_column_null(:books, :in_series, false)
    change_column_null(:books, :seq_in_series, true)

    # Book Detail
    change_column_null(:book_details, :edition, true)
    change_column_null(:book_details, :isbn, true)

    # Genre
    change_column_null(:genres, :name, false)

    # Forum Post
    change_column_null(:forum_posts, :content, true)
    change_column_null(:forum_posts, :title, false)
    change_column_null(:forum_posts, :date_created, false)
    change_column_null(:forum_posts, :last_modified, true)
    change_column_null(:forum_posts, :deleted, false, false)
    
    # Comment
    change_column_null(:comments, :content, false)
    change_column_null(:comments, :date_created, false)
    change_column_null(:comments, :date_modified, true)
    change_column_null(:comments, :deleted, false)

  end
end
