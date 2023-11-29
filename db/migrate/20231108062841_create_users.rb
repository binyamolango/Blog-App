class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.bigint :posts_count, default: 0
      t.timestamps
      t.string :address
      t.string :role, default: "default"
    end

    add_index :users, :address
  end
end
