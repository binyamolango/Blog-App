class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params.merge(user_id: @user.id, post_id: @post.id))
    
    if @comment.save
      redirect_to user_posts_path(@post.author)
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment
      @comment.destroy
      flash[:notice] = "Comment deleted successfully"
      redirect_to user_posts_path(@post.author)
    else
      flash[:notice] = "Comment could not be found"
      redirect_to user_posts_path(@post.author)
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end
