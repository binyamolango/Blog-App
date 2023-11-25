class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user: @post.author, post: @post)

    if @like.save
      flash[:success] = 'You liked the post.'
      redirect_to user_posts_path(@post.author.id, @post.id)
    else
      flash.now[:error] = 'Error'
    end
  end
end
