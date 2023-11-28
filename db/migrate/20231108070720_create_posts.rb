class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.bigint :comments_count, default: 0
      t.bigint :likes_count, default: 0
      t.timestamps
      t.string :address
    end

    add_index :comments, :address
    add_reference :posts, :author, null: false, on_delete: :cascade, foreign_key: { to_table: :users }
  end
end
