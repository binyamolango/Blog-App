class User < ActiveRecord::Base
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  validates :name, presence: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
