require 'rails_helper'

RSpec.describe User, type: :model do
  #tests go here
  subject { User.new(name: 'Binyam', photo: 'url', bio: 'Hi there', posts_count: 3 ) }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'photo should have url' do
    expect(subject.photo).to eq "url"
  end

  it 'bio should be present' do
    expect(subject.bio).to eq "Hi there"
  end

  it 'posts_count should be integer' do
    subject.posts_count = 3.5
    expect(subject).to_not be_valid
  end

  it 'posts_count should be greater or equal to zero' do
    subject.posts_count = -4
    expect(subject).to_not be_valid
  end

  it '#recent_posts method should display 3 recent posts' do
    # Stub out the database interaction
    posts_relation = double('posts_relation')
    allow(subject).to receive(:posts).and_return(posts_relation)

    # Define the expected behavior of the mocked posts_relation
    recent_posts = [
      double('third_post'),
      double('second_post'),
      double('first_post')
    ]
    expect(posts_relation).to receive(:order).with(created_at: :desc).and_return(posts_relation)
    expect(posts_relation).to receive(:limit).with(3).and_return(recent_posts)

    # Call the method and verify the result
    expect(subject.recent_posts).to eq recent_posts
  end
end
