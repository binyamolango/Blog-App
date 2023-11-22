require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1')
    @user2 = User.create(name: 'John', photo: 'photo_url2')
  end

  scenario 'display the username of all users' do
    visit users_path
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'display the profile picture of each user' do
    visit users_path
    expect(page).to have_css("img[src='photo_url1']")
    expect(page).to have_css("img[src='photo_url2']")
  end
end
