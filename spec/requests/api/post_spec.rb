require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  path '/api/users/{user_id}/posts' do
    get 'Retrieves all posts for a specific user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'user_id'

      response '200', 'posts found' do
        schema type: :object,
               properties: {
                 posts: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       title: { type: :string },
                       text: { type: :string },
                       created_at: { type: :string, format: 'date-time' },
                       updated_at: { type: :string, format: 'date-time' },
                       author_id: { type: :integer },
                       comments: {
                         type: :array,
                         items: {
                           type: :object,
                           properties: {
                             id: { type: :integer },
                             text: { type: :string },
                             created_at: { type: :string, format: 'date-time' },
                             updated_at: { type: :string, format: 'date-time' }
                           }
                         }
                       }
                     }
                   }
                 }
               }

        let(:user_id) { User.create(name: 'Sample User').id }
        let!(:posts) { create_list(:post, 3, author: User.find(user_id)) }

        run_test!
      end

      response '404', 'user not found' do
        let(:user_id) { 'invalid' }

        run_test!
      end
    end
  end
end
