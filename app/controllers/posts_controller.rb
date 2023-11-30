class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user

  def index
    @posts = Post.includes(:author, :comments).where(author_id: params[:user_id]).paginate(page: params[:page],
                                                                                           per_page: 3)

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @post = @user.posts.find_by(id: params[:id])
    if @post
      @post.destroy
      flash[:notice] = 'Post was successfully deleted.'
    else
      flash[:alert] = 'Post could not be found.'
    end
    redirect_to user_posts_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
