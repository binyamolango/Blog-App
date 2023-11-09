class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_create :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_count)
  end

  def recent_comments
    comments.order(updated_at: :desc).limit(5)
  end
end
