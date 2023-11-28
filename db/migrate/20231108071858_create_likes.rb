class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes, &:timestamps
    t.string :address
  end

    add_reference :likes, :post, null: false, foreign_key: true
    add_reference :likes, :user, null: false, foreign_key: true
    add_index :likes, :address
end
