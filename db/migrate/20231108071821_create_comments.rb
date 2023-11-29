class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamps
      t.string :address
      t.references :post, null: false, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, foreign_key: true
    end

    add_index :comments, :address
  end
end
