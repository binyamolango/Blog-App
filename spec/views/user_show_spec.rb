require 'rails_helper'

RSpec.describe 'users#show', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1', bio: 'I am a software developer.', posts_count: 3)
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

  # scenario 'clicking on a user redirects to the user show page' do
  #   visit users_path
  #   click_link @user1.name
  #   expect(current_path).to eq(user_path(@user1))
  # end
end
