class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def update_likes_counter
    post.!increment(:likes_count)
  end
end
