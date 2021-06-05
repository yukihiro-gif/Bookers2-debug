class CreatePostcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :postcomments do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :post_comment

      t.timestamps
    end
  end
end
