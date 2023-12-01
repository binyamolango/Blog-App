require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  # create some initial data
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:comments) { create_list(:comment, 10, post: post, user: user) }
  let(:post_id) { post.id }
  let(:user_id) { user.id }
  let(:comment_id) { comments.first.id }
  let(:headers) { { "ACCEPT" => "application/json" } } # add any required headers

  # Test suite for GET /users/:user_id/posts/:post_id/comments
  describe 'GET /users/:user_id/posts/:post_id/comments' do
    # make HTTP get request before each example
    before { get "/users/#{user_id}/posts/#{post_id}/comments", headers: headers }

    it 'returns comments' do
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /posts/:post_id/comments
  describe 'POST /posts/:post_id/comments' do
    let(:valid_attributes) { { comment: { text: 'Visit Narnia', user_id: user_id } } }

    context 'when the request is valid' do
      before do
        post "/posts/#{post_id}/comments", params: valid_attributes, headers: headers
      end

      it 'creates a comment' do
        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)['text']).to eq('Visit Narnia')
      end
    end

    context 'when the request is invalid' do
      before { post "/posts/#{post_id}/comments", params: { comment: { text: nil } }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to include("errors")
      end
    end
  end

end
