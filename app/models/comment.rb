class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  after_create :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_count)
  end
end
