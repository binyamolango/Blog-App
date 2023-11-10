require 'rails_helper'

RSpec.describe Like, type: :model do
  #tests go here
  post1 = Post.new(title: 'Hello', text: 'This is my first post', comments_count: 2, likes_count: 3)
  like1 = Like.new(post: post1)
  like2 = Like.new(post: post1)

  it '#update_likes_counter method should increment likes_count in post model' do
    like1.update_likes_counter
    like2.update_likes_counter
    expect(post1.likes_count).to eq 5
  end
end
