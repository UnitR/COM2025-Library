class CreateForumPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_posts do |t|
      t.integer :user_id
      t.text :content
      t.datetime :date_created
      t.datetime :last_modified
      t.boolean :deleted

      t.timestamps
    end
  end
end
