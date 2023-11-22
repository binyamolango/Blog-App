require 'rails_helper'

RSpec.describe 'comments#new', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1', bio: 'I am a software developer.', posts_count: 1)
    @user2 = User.create(name: 'John', photo: 'photo_url2', posts_count: 0)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Good.', comments_count: 0, likes_count: 0)
    @comment1 = Comment.create(user: @user2, post: @post1, text: 'Great work Benjamin')
  end

  scenario 'display Add new comment' do
    visit new_user_post_comment_path(user_id: @post1.author.id, post_id: @post1.id)
    expect(page).to have_content("Add new comment")
  end

  # scenario 'clicking on a comment button redirects to the comment new page' do
  #   visit user_post_path(@user1, @post1)
  #   click_link("Comment")
  #   expect(current_path).to eq(new_user_post_comment_path(user_id: @user1.id, post_id: @user1.posts[0].id))
  # end

  # scenario 'clicking on a like button redirects to the like create page' do
  #   visit user_post_path(@user1, @post1)
  #   click_button("Like")
  #   expect(current_path).to eq(user_posts_path(@post1.author.id, @post1.id))
  # end
end
