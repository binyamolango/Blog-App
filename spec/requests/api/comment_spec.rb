require 'swagger_helper'

RSpec.describe 'Api::Comments', type: :request do
  path '/api/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :integer, required: true
    parameter name: 'post_id', in: :path, type: :integer, required: true

    get 'Retrieves all comments for a post' do
      tags 'Comments'
      produces 'application/json'
      description 'Retrieves all comments for a specific post.'

      response '200', 'Comments found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              text: { type: :string },
              user_id: { type: :integer }
            },
            required: ['id', 'text', 'user_id']
          }

        examples 'application/json' => [
          { id: 1, text: 'Great post!', user_id: 1 },
          { id: 2, text: 'Nice work!', user_id: 2 }
        ]

        run_test!
      end

      response '404', 'Post not found' do
        run_test!
      end
    end

    post 'Creates a new comment for a post' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      description 'Creates a new comment for a specific post.'

      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string },
          user_id: { type: :integer }
        },
        required: ['text', 'user_id']
      }

      response '201', 'Comment created' do
        let(:comment) { { text: 'Awesome post!', user_id: 1 } }

        schema type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            user_id: { type: :integer }
          },
          required: ['id', 'text', 'user_id']

        examples 'application/json' => { id: 3, text: 'Awesome post!', user_id: 1 }

        run_test!
      end

      response '422', 'Invalid parameters' do
        let(:comment) { { text: '', user_id: 1 } }

        schema type: :object,
          properties: {
            error: { type: :string }
          },
          required: ['error']

        examples 'application/json' => { error: "Text can't be blank" }

        run_test!
      end
    end
  end
end
