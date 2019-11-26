class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :content
      t.datetime :date_created
      t.datetime :date_modified
      t.boolean :deleted

      t.timestamps
    end
  end
end
