class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user

  def index
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 3).accessible_by(current_ability)
  end

  def show
    @post = @user.posts.find(params[:id])
    authorize! :read, @post
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
      redirect_to user_posts_path(@user)
    else
      flash[:alert] = 'Post could not be found.'
      redirect_to user_posts_path(@user)
    end
  end  

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
