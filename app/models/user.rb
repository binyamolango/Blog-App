class User < ActiveRecord
  has_many :posts, :likes, :comments
end
