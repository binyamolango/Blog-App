class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.bigint :comments_count
      t.bigint :likes_count
      t.timestamps
    end
  end
end
