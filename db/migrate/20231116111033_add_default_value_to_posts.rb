class AddDefaultValueToPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :comments_count, :bigint, default: 0
    change_column :posts, :likes_count, :bigint, default: 0
  end
end
