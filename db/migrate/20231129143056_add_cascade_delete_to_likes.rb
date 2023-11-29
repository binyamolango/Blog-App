class AddCascadeDeleteToLikes < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :likes, :posts  # Remove existing foreign key constraint
    add_foreign_key :likes, :posts, on_delete: :cascade  # Add new foreign key with cascade delete
  end
end
