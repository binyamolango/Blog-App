class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user_id: @post.author.id, post_id: @post.id, text: params[:comment][:text])
    if @comment.save
      flash[:notice] = 'Comment created succesfully!'
      redirect_to user_post_comments_path(@post.author.id, @post.id)
    else
      render 'new'
    end
  end
end
