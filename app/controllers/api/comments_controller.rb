class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_authorization_check only: [:create]
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end
end
