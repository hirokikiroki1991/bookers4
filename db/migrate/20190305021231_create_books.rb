class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :book_title
      t.text :book_comment
      t.integer :user_id

      t.timestamps
    end

end
