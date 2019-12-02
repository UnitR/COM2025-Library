class SetModelSettings < ActiveRecord::Migration[5.2]
  def change

    # Remove unnecessary columns from model creation
    remove_column :books, :genre_id
    remove_column :books, :author_id

    # Add missing columns
    add_column :forum_posts, :title, :string

    # Set foreign keys
    add_foreign_key :book_detail, :book
    add_foreign_key :author, :book
    add_foreign_key :genre, :book
    add_foreign_key :comment, :forum_post
    add_foreign_key :comment, :user
    add_foreign_key :forum_post, :user

    # Add indices
    add_index(:forum_posts, [:id, :title], unique: true)
    add_index(:forum_posts, :title)
    add_index(:forum_posts, :deleted)
    add_index(:comments, [:id, :user_id, :post_id], unique: true)
    add_index(:authors, [:first_name, :last_name], unique: true)
    add_index(:books, :book_name)
    add_index(:book_details, :book_id)
    add_index(:genres, :name, unique: true)

    # ---- Set nullable rules ----
    # Book
    change_column_null(:books, :book_name, false)
    change_column_null(:books, :in_series, false)
    change_column_null(:books, :seq_in_series, true)

    # Book Detail
    change_column_null(:book_details, :book_id, false)
    change_column_null(:book_details, :edition, true)
    change_column_null(:book_details, :isbn, true)

    # Genre
    change_column_null(:genres, :name, false)

    # Author
    change_column_null(:authors, :first_name, false)
    change_column_null(:authors, :last_names, false)
    change_column_null(:authors, :date_born, true)
    change_column_null(:authors, :date_dead, true)

    # Forum Post
    change_column_null(:forum_posts, :user_id, false)
    change_column_null(:forum_posts, :content, true)
    change_column_null(:forum_posts, :title, false)
    change_column_null(:forum_posts, :date_created, false)
    change_column_null(:forum_posts, :last_modified, true)
    change_column_null(:forum_posts, :deleted, false, false)
    
    # Comment
    change_column_null(:comments, :user_id, false)
    change_column_null(:comments, :post_id, false)
    change_column_null(:comments, :content, false)
    change_column_null(:comments, :date_created, false)
    change_column_null(:comments, :date_modified, true)
    change_column_null(:comments, :deleted, false)

  end
end
