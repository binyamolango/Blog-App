require 'rails_helper'

RSpec.describe 'users#show', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1', bio: 'I am a software developer.', posts_count: 3)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Good.', comments_count: 3, likes_count: 4)
    @post2 = Post.create(author: @user1, title: 'Hi Hello', text: 'Great', comments_count: 2, likes_count: 3)
    @post3 = Post.create(author: @user1, title: 'Hello Hi', text: 'Awesome.', comments_count: 1, likes_count: 2)
  end

  scenario 'display the username of all users' do
    visit user_path(@user1)
    expect(page).to have_content(@user1.name)
  end

  scenario 'display the profile picture of each user' do
    visit user_path(@user1)
    expect(page).to have_css("img[src='photo_url1']")
  end

  scenario 'display the number of posts each user has written' do
    visit user_path(@user1)
    expect(page).to have_content("Number of posts: #{@user1.posts_count}")
  end

  scenario 'display the bio of the user' do
    visit user_path(@user1)
    expect(page).to have_content(@user1.bio)
  end

  scenario 'display the user first 3 posts' do
    visit user_path(@user1)
    @user1.recent_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  # scenario 'clicking on a user redirects to the user show page' do
  #   visit users_path
  #   click_link @user1.name
  #   expect(current_path).to eq(user_path(@user1))
  # end
end
