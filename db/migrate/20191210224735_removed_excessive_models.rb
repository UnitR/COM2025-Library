class RemovedExcessiveModels < ActiveRecord::Migration[5.2]
  def change
    drop_table "comments"
    drop_table "forum_posts"
    drop_table "genres"
  end
end
