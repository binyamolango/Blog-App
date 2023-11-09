class Post < ActiveRecord::Base
  belongs_to :author
  has_many :likes
  has_many :comments
end
