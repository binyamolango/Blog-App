class AddAddressToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :address, :string
    add_index :likes, :address
  end
end
