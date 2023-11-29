class AddCascadeDeleteToComments < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :comments, :posts  # Remove existing foreign key constraint
    add_foreign_key :comments, :posts, on_delete: :cascade  # Add new foreign key with cascade delete
  end
end
