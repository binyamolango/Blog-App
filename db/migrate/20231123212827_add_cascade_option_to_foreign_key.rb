class AddCascadeOptionToForeignKey < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :posts, :users
    add_foreign_key :posts, :users, column: :author_id, on_delete: :cascade
  end
end
