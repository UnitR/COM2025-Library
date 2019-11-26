class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_names
      t.date :date_born
      t.date :date_dead

      t.timestamps
    end
  end
end
