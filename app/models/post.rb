class Post < ActiveRecord
  belongs_to :author
  has_many :likes, :comments
end
